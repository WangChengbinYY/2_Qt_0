#include "mainwindow.h"
#include <QApplication>
#include <SerialThread.h>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();



    SerialThread *serialThread = new SerialThread();
    serialThread->start();




    return a.exec();
}
