#include<iostream>
#include "math.h"

int main()
{
    int a = 5;
    int b = 3;

    auto sum = math::add(a, b);
    std::cout << "Sum: " << sum << std::endl;

    auto difference = math::subtract(a, b);
    std::cout << "Difference: " << difference << std::endl;

    auto product = math::multiply(a, b);
    std::cout << "Product: " << product << std::endl;

    auto quotient = math::divide(a, b);
    std::cout << "Quotient: " << quotient << std::endl;

    return 0;
}