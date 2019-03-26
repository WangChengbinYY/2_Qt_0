/*
 * SerialThread.h
 *
 *  Created on: 18-07-12
 *      Author: hailiang
 */

#ifndef SERIALSIM_SERIALTHREAD_H
#define SERIALSIM_SERIALTHREAD_H

#include <QThread>
#include <QtSerialPort/QSerialPort>

/******************************************************************************
 * 数据包结构定义
 */
#pragma pack(2)

/* 38bytes */
typedef struct {
    uint8_t  head1;
    uint8_t  head2;
    uint16_t week;
    double   time;
    float    gyrox;
    float    gyroy;
    float    gyroz;
    float    accx;
    float    accy;
    float    accz;
    uint8_t  check1;
    uint8_t  check2;
} ImuPack;

/* 42bytes */
typedef struct {
    uint8_t  head1;
    uint8_t  head2;
    uint16_t week;
    int      time;
    double   lat;
    double   lon;
    float    alt;
    float    latstd;
    float    lonstd;
    float    altstd;
    uint8_t  check1;
    uint8_t  check2;
} GnssPack;

#pragma pack()

/******************************************************************************
 * 主线程类声明
 */
class SerialThread : public QThread {
  public:
    SerialThread();

  private:
    void exitApplication();
    void readImuData(FILE *fp, ImuPack *imupack);
    void readGnssData(FILE *fp, GnssPack *gnsspack);

    bool openSerialPort(QSerialPort *serial, QString portname);

    double getMicroSeconds();

  protected:
    void run() override;
};

#endif // SERIALSIM_SERIALTHREAD_H
