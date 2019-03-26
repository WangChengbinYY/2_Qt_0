
#include <SerialThread.h>


#include <QCoreApplication>
#include <QtSerialPort/QSerialPort>
#include <QString>
#include <QDateTime>

#include <iostream>

#include <math.h>
#include <stdint.h>
#include <sys/time.h>
#include <unistd.h>

using namespace std;

SerialThread::SerialThread() {
}

void SerialThread::run() {
    cout << "start simulation!" << endl;

    /**************************************************************************
     * 串口配置
     */
    QSerialPort imuserial;
    QSerialPort gnssserial;

    QString portname;
//    cout << "UART1 Port for gnss, linux(ttyUSB*), windows(COM*):" << endl;
//    cin >> portname;
    portname = "COM7";
    if (!openSerialPort(&gnssserial, portname)) {
        cout << "UART1_GNSS open failed!" << endl;
        exitApplication();
    }

//    cout << "UART2 Port for imu, linux(ttyUSB*), windows(COM*):" << endl;
//    cin >> portname;
    portname = "COM6";
    if (!openSerialPort(&imuserial, portname)) {
        cout << "UART2_IMU open failed!" << endl;
        exitApplication();
    }

    /**************************************************************************
     * 数据文件配置
     */

    char imufilename[256] = "E:\\data\\pos830.bin";
    char gnssfilename[256] = "E:\\data\\GNSS19700101_54.txt";
    char navfilename[256] = "E:\\data\\navresult.rtnav";



    FILE *imufp;
    FILE *gnssfp;
    FILE *navfp;

    imufp = fopen(imufilename, "rb");
    if (!imufp) {
        cout << "imu file open failed!" << endl;
        exitApplication();
    }

    gnssfp = fopen(gnssfilename, "r");
    if (!gnssfp) {
        cout << "gnss file open failed!" << endl;
        exitApplication();
    }

    navfp = fopen(navfilename, "wb");
    if (!navfp) {
        cout << "nav file open failed!" << endl;
        exitApplication();
    }

    /**************************************************************************
     * 数据转发模拟
     */
    ImuPack  imupack;
    GnssPack gnsspack;
    double   dt;

    readImuData(imufp, &imupack);
    readGnssData(gnssfp, &gnsspack);

    /* 数据对齐, 以GNSS数据时间为基准, IMU数据对齐整秒开始第一个数据 */
    while (imupack.time > gnsspack.time) {
        readGnssData(gnssfp, &gnsspack);
    }

    while (imupack.time < gnsspack.time) {
        readImuData(imufp, &imupack);
    }

    char       txbuff[64];
    int        size;
    QByteArray bytearray;
    while (1) {
        /**
         * 先发送IMU数据, 再发送GNSS数据, 保证逻辑时序
         */

        /* 发送读取的IMU数据, 保证时序 */
        size = sizeof(ImuPack);
        memcpy(txbuff, &imupack, (size_t) size);
        for (int k = 2; k < (size - 2); k++) {
            txbuff[size - 2] += txbuff[k];
            txbuff[size - 1] += txbuff[size - 2];
        }
        imuserial.write(txbuff, size);
        imuserial.flush();
        while(!imuserial.waitForBytesWritten(1));

        if (imupack.time >= gnsspack.time) {
            /* 越过整秒, 发送GNSS数据 */
            size = sizeof(GnssPack);
            memcpy(txbuff, &gnsspack, (size_t) size);
            for (int k = 2; k < (size - 2); k++) {
                txbuff[size - 2] += txbuff[k];
                txbuff[size - 1] += txbuff[size - 2];
            }
//            gnssserial.write(txbuff, size);
//            gnssserial.flush();

            /* 读取下一秒的GNSS数据 */
            readGnssData(gnssfp, &gnsspack);
            if (feof(gnssfp))
                break;

            cout << "sow = " << gnsspack.time << endl;
        }

        /* 读取新的数据, 并延时处理 */
        dt = imupack.time;

        readImuData(imufp, &imupack);
        if (feof(imufp))
            break;

        /* time interval in ms */
        dt = (imupack.time - dt) * 1000;

        /* 读取导航结果, 延时等待时间设置为历元之间的间隔 */
        double ts, te;
        ts = QDateTime::currentDateTime().toMSecsSinceEpoch();
        if (gnssserial.waitForReadyRead(dt)) {
            bytearray = gnssserial.readAll();
            if (bytearray.size() > 0) {
                fwrite(bytearray.data(), 1, (size_t) bytearray.size(), navfp);
            }
        }
        te = QDateTime::currentDateTime().toMSecsSinceEpoch();
        if ((te - ts) < dt)
            usleep((dt + ts - te) * 1000);
    }

    /* 继续接收未完成的数据 */
    if (gnssserial.waitForReadyRead(1000)) {
        bytearray = gnssserial.readAll();
        if (bytearray.size() > 0) {
            fwrite(bytearray.data(), 1, (size_t) bytearray.size(), navfp);
        }
    }

    /**************************************************************************
     * 程序结束处理
     */
    /* 关闭串口 */
    imuserial.close();
    gnssserial.close();

    /* 关闭文件 */
    fclose(imufp);
    fclose(gnssfp);
    fclose(navfp);

    /* 应用程序结束 */
    exitApplication();
}

void SerialThread::exitApplication() {
    QCoreApplication::exit();
}

void SerialThread::readImuData(FILE *fp, ImuPack *imupack) {
    double data[7];
    fread(data, sizeof(double), 7, fp);

    imupack->head1  = 0x55;
    imupack->head2  = 0xAA;
    imupack->week   = 0;
    imupack->time   = data[0];
    imupack->gyrox  = (float) data[1];
    imupack->gyroy  = (float) data[2];
    imupack->gyroz  = (float) data[3];
    imupack->accx   = (float) data[4];
    imupack->accy   = (float) data[5];
    imupack->accz   = (float) data[6];
    imupack->check1 = 0;
    imupack->check2 = 0;
}

void SerialThread::readGnssData(FILE *fp, GnssPack *gnsspack) {
    double data[7];

    char  buff[256];
    char *ptr;

    fgets(buff, 256, fp);

    ptr = strtok(buff, " ");
    for (int k = 0; k < 7; k++) {
        data[k] = strtod(ptr, NULL);
        ptr     = strtok(NULL, " ");
    }

    gnsspack->head1  = 0xAA;
    gnsspack->head2  = 0x55;
    gnsspack->week   = 0;
    gnsspack->time   = (int) lround(data[0]);
    gnsspack->lat    = data[1];
    gnsspack->lon    = data[2];
    gnsspack->alt    = (float) data[3];
    gnsspack->latstd = (float) data[4];
    gnsspack->lonstd = (float) data[5];
    gnsspack->altstd = (float) data[6];
    gnsspack->check1 = 0;
    gnsspack->check2 = 0;
}

bool SerialThread::openSerialPort(QSerialPort *serial, QString portname) {
    /* 串口配置 */
    //serial->setBaudRate(QSerialPort::Baud115200,QSerialPort::AllDirections);
    serial->setBaudRate(QSerialPort::Baud115200,QSerialPort::Output);

    serial->setDataBits(QSerialPort::Data8);
    serial->setFlowControl(QSerialPort::NoFlowControl);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);

    serial->setPortName(portname);

    return serial->open(QSerialPort::ReadWrite);
}
