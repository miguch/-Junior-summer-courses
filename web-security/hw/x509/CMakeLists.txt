cmake_minimum_required(VERSION 3.10)
project(x509)

set(CMAKE_CXX_STANDARD 11)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


if (APPLE)
    add_executable(x509-mac main.cpp)
endif(APPLE)

if(UNIX AND NOT APPLE)
    add_executable(x509-linux main.cpp)
endif(UNIX AND NOT APPLE)

if (WIN32)
    add_executable(x509 main.cpp)
endif(WIN32)


include_directories(.)