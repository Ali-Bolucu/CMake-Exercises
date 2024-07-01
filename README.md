# CMake-Exercises

# --01 - Makefile

Generates the .exe file
```
$ mingw32-make -f makefile
```

# --02 - CMake

Install CMake
Create CMakeLists.txt in the directory

For Windows, in order to create Makefile -G "MinGW Makefiles" is needed
```
cmake -G "MinGW Makefiles" -S . -B out/build/
```

-CMake
``` cmake
cmake_minimum_required(VERSION 3.26.5)

project(Deneme)  # Projenin adını belirliyor

add_executable(${PROJECT_NAME} main.cpp)  # Projenin adını kullanarak build içine .exe dosyası oluşturuyor.
```

# --03 - CMake : Compile and linking libraries

``` cmake
cmake_minimum_required(VERSION 3.26.5)
set(CMAKE_CXX_STANDARD 17) # Sets the C++ version to be used
set(CMAKE_CXX_STANDARD_REQUIRED ON) # Make the given c++ version mandatory

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) # Contains .a or .dll.a files
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) # Contains .exe and .dll files

project(library_test)

# STATIC: Create a static library with extension .a
# SHARED: Create a shared library with extension .dll and copies dll to the bin folder
add_library(my_math STATIC math.h math.cpp) 

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} my_math) # Linking the library file with executable
```
