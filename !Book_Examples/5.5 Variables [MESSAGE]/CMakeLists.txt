cmake_minimum_required(VERSION 3.1)
project(Variables_Scope_Test)

message(STATUS "STATUS AAA")
message(WARNING "WARNING AAA")
message(AUTHOR_WARNING "AUTHOR_WARNING AAA")
message(SEND_ERROR "SEND_ERROR AAA")
message(FATAL_ERROR "FATAL_ERROR AAA")
message(DEPRECATION "DEPRECATION AAA")


add_executable(myExe main.cpp)