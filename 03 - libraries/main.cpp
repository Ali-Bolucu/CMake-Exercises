#include <iostream>
#include <cassert>
#include "math.h"

int main()
{

    assert(hello::add(2, 3) == 5);
    assert(hello::subtract(5, 2) == 3);
    assert(hello::multiply(2, 3) == 6);

    assert(hello::divide(10, 5) == 2);
    try {
        hello::divide(5, 0);
        assert(false); // Should throw an exception
    } catch (const std::runtime_error& e) {
        // Division by zero exception caught
    }

    std::cout << "All tests passed!" << std::endl;

    return 0;
}