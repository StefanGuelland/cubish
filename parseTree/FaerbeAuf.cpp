//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include <Cube.h>
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
    Cube::CubeColor color = {
            .red = r,
            .green = g,
            .blue = b,
    };
    Cube::singleton.faerbeCube(color);
}
