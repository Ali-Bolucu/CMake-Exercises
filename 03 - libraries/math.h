#ifndef MATH_H
#define MATH_H

#include <type_traits>
#include <iostream>

namespace hello {
    template <typename T, typename = std::enable_if_t<std::is_arithmetic<T>::value>>
    int add(T a, T b) {
        return a + b;
    }

    template <typename T, typename = std::enable_if_t<std::is_arithmetic<T>::value>>
    int subtract(T a, T b) {
        return a - b;
    }

    template <typename T, typename = std::enable_if_t<std::is_arithmetic<T>::value>>
    int multiply(T a, T b) {
        return a * b;
    }

    template <typename T, typename = std::enable_if_t<std::is_arithmetic<T>::value>>
    int divide(T a, T b) {
        if (b != 0) {
            return a / b;
        } else {
            throw std::runtime_error("Division by zero");
        }
    }
}


#endif // MATH_H