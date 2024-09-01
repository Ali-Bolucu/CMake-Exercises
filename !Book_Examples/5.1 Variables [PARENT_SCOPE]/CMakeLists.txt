cmake_minimum_required(VERSION 3.1)
project(Variables_Scope_Test)

###################################################

set(MY_VARIABLE "Hello from Top-level")
add_subdirectory(AltKlasor)

message(STATUS "MY_VARIABLE in parent scope: " ${MY_VARIABLE})

###################################################


add_executable(myExe main.cpp)