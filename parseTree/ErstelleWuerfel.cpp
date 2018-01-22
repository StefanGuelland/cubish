//
// Created by sguelland on 18.01.18.
//

#include "ErstelleWuerfel.h"
#include <string>
#include <iostream>

ParseTree::ErstelleWuerfel::ErstelleWuerfel(const char *variable_, int size_) {
    variable = std::string(variable_);
    size = size_;
}

void ParseTree::ErstelleWuerfel::Execute(void) {
    std::cout
            << "\tErstelleWuerfel "
            << variable
            << " size "
            << size
            << std::endl;
}
