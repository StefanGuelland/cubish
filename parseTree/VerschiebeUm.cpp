//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include "VerschiebeUm.h"

ParseTree::VerschiebeUm::VerschiebeUm(const char *variable_, int x_, int y_, int z_) {
    variable = std::string(variable_);
    x = x_;
    y = y_;
    z = z_;
}

void ParseTree::VerschiebeUm::Execute(void) {
    std::cout
            << "\tVerschiebe um "
            << variable
            << " x: " << x
            << " y: " << y
            << " z: " << z
            << std::endl;
}
