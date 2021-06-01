#include <iostream>

#include "darwin.hh"
#include "posix.hh"

auto main() -> int
{
    std::cout << "logger" << std::endl;

    posix();
    darwin();

    return 0;
}
