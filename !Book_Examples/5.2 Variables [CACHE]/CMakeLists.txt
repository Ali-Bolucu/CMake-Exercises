cmake_minimum_required(VERSION 3.1)
project(Variables_Scope_Test)


option(cacheVariable "Buraya bakarlar" ON)

set(trafficLight Green CACHE STRING "Status of something") 
set_property(CACHE trafficLight PROPERTY STRINGS Red Orange Green)

add_executable(myExe main.cpp)