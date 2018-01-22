//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include "FaerbeUm.h"

ParseTree::FaerbeUm::FaerbeUm(const char *variable_, int r_, int g_, int b_) {
    variable = std::string(variable_);
    r = r_;
    g = g_;
    b = b_;
}

void ParseTree::FaerbeUm::Execute(void) {
    std::cout
            << "\tFaerbe um "
            << variable
            << " r: " << r
            << " g: " << g
            << " b: " << b
            << std::endl;
}
