#include <QCoreApplication>
#include <iostream>
#include <QString>

typedef uint16_t u16;
typedef uint8_t  u8;

#pragma pack(2)
typedef struct {
    u8     head1;    /* 数据头0x55 */
    u8     head2;    /* 数据头0xAA */
    double weeksec;  /* GPS周内秒,s */
    double lat;      /* 纬度,deg */
    double lon;      /* 经度,deg */
    float  alt;      /* 椭球高,m */
    float  velnorth; /* 北向速度,m/s */
    float  veleast;  /* 东向速度,m/s */
    float  veldown;  /* 地向速度,m/s */
    float  roll;     /* 横滚角,deg */
    float  pitch;    /* 俯仰角,deg */
    float  yaw;      /* 航向角,deg */
    unsigned int timeused;
    u8     check1; /* 校验和 */
    u8     check2; /* 校验和 */
} NavPack;
#pragma pack()

#define  NAV_PACK_SIZE sizeof(NavPack)

using namespace std;


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    NavPack mNavPack;
    cout << "double is " <<sizeof(double) << " char!" << endl;
    cout << "float is " <<sizeof(float) << " char!" << endl;
    cout << "char is " <<sizeof(char) << " char!" << endl;
    cout << "unsigned int is " <<sizeof(unsigned int) << " char!" << endl;
     cout << "NavPack is " <<sizeof(NavPack) << " char!" << endl;

    memset(&mNavPack,0,sizeof(mNavPack));
    FILE *navfp;
    FILE *resultfp;
    char navfilename[256] = "E:\\data\\navresult.rtnav";
    char resultfilename[256] = "E:\\data\\navresult_matlab.txt";
    navfp = fopen(navfilename, "rb");
    if (!navfp) {
        cout << "nav file open failed!" << endl;
        return a.exec();
    }
    resultfp = fopen(resultfilename, "w");
    if (!navfp) {
        cout << "navMatlab.txt file open failed!" << endl;
        return a.exec();
    }


    char mResult[256]={0};

    while (!feof(navfp)){
        fread(&mNavPack,NAV_PACK_SIZE,1,navfp);

        mNavPack.lat = mNavPack.lat * 57.29577951308232;
        mNavPack.lon = mNavPack.lon * 57.29577951308232;

        sprintf(mResult,"%.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %d\n",
                mNavPack.weeksec,mNavPack.lat,mNavPack.lon,mNavPack.alt,mNavPack.velnorth,
                mNavPack.veleast,mNavPack.veldown,mNavPack.roll,mNavPack.pitch,mNavPack.yaw,
                mNavPack.timeused);
        fputs(mResult,resultfp);
    }

    fclose(resultfp);
    fclose(navfp);
    cout << "It's OVER!" << endl;
    return a.exec();
}
