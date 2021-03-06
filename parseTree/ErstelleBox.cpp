//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include "ErstelleBox.h"

ParseTree::ErstelleBox::ErstelleBox(const char *variable_, int x_, int y_, int z_) {
    variable = std::string(variable_);
    x = x_;
    y = y_;
    z = z_;
}

void ParseTree::ErstelleBox::Execute(void) {
    std::cout
            << "\tErstelleBox "
            << variable
            << " x: " << x
            << " y: " << y
            << " z: " << z
            << std::endl;
}
