cmake_minimum_required(VERSION 3.26.5)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

project(library_test)

# STATIC: Create a static library with extension .a
# SHARED: Create a shared library with extension .dll and copyies to dll to the bin folder
add_library(my_math STATIC math.h math.cpp) 

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} my_math)


