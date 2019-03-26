cmake_minimum_required(VERSION 3.10)
project(serialsim)

set(CMAKE_AUTOMOC ON)

add_executable(${PROJECT_NAME} main.cpp SerialThread.cpp)
target_link_libraries(${PROJECT_NAME} m)

# QT library
set(CMAKE_PREFIX_PATH "D:\\Qt\\Qt5.11.1\\5.11.1\\mingw53_32")
find_package(Qt5SerialPort)
find_package(Qt5Core)

qt5_use_modules(${PROJECT_NAME} Core SerialPort)
