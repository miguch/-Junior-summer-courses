cmake_minimum_required(VERSION 3.10)
project(code)

set(CMAKE_CXX_STANDARD 11)

include_directories(.)

set (CMAKE_CXX_FLAGS "-lX11 -L/usr/X11/lib -I/usr/X11/include")

add_executable(code
        canny.cpp
        canny.h
        CImg.h
        main.cpp)
