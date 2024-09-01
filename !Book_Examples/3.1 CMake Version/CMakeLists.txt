#cmake_minimum_required(VERSION 2.0...2.9) # Gives error

cmake_minimum_required(VERSION 3.1)

project(versionTest
    VERSION 1.2.3
    DESCRIPTION "Testing"
    HOMEPAGE_URL " URLLLLLLL"
    LANGUAGES CXX C)
    
set(SOURCES main.cpp)


message("CMAKE_PROJECT_HOMEPAGE_URL = " ${CMAKE_PROJECT_HOMEPAGE_URL})

add_executable(myExe ${SOURCES})