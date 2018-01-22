//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include "FaerbeAuf.h"

ParseTree::FaerbeAuf::FaerbeAuf(const char *variable_, int r_, int g_, int b_) {
    variable = std::string(variable_);
    r = r_;
    g = g_;
    b = b_;
}

void ParseTree::FaerbeAuf::Execute(void) {
    std::cout
            << "\tFaerbe auf "
            << variable
            << " r: " << r
            << " g: " << g
            << " b: " << b
            << std::endl;
}
