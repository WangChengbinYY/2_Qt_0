/*
 * main.cpp
 *
 *  Created on: 18-07-12
 *      Author: hailiang
 */

#include "SerialThread.h"
#include <QCoreApplication>

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);

    SerialThread *serialThread = new SerialThread();
    serialThread->start();

    return app.exec();
}