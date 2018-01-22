//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include "VerschiebeAuf.h"

ParseTree::VerschiebeAuf::VerschiebeAuf(const char *variable_, int x_, int y_, int z_) {
    variable = std::string(variable_);
    x = x_;
    y = y_;
    z = z_;
}

void ParseTree::VerschiebeAuf::Execute(void) {
    std::cout
            << "\tVerschiebe auf "
            << variable
            << " x: " << x
            << " y: " << y
            << " z: " << z
            << std::endl;
}
