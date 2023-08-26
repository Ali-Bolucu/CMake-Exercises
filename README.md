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

