#include <iostream>

#ifdef USE_OPTIONAL_LIB
#include "math.h"
#endif

int main()
{
    std::cout << "Hey \n";

#ifdef USE_OPTIONAL_LIB
    hello::add(2, 3);
    std::cout << "math \n";
#endif

    return 0;
}

int WinMain()
{
    std::cout << "Hey from winmain \n";
    return 0;
}