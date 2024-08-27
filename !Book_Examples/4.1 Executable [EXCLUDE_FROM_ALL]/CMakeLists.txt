cmake_minimum_required(VERSION 3.26)
project(optional_library_test)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(USE_OPTIONAL_LIB ON CACHE BOOL "Build and use the optional library" FORCE)

add_library(anotherlib MODULE anotherlib.cpp)

add_executable(App main.cpp)
add_library(my_math SHARED EXCLUDE_FROM_ALL math.h math.cpp )

if(USE_OPTIONAL_LIB)
    add_dependencies(App my_math)

    target_link_libraries(App PRIVATE my_math)
    target_compile_definitions(App PRIVATE USE_OPTIONAL_LIB)
endif()
