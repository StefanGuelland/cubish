//
// Created by sguelland on 18.01.18.
//

#include "ErstelleZahl.h"
#include <iostream>

void ParseTree::ErstelleZahl::Execute(void) {
    std::cout << "\tErstelle Zahl " << variable << std::endl;
}

ParseTree::ErstelleZahl::ErstelleZahl(std::string string_) {
    variable = string_;
}

ParseTree::ErstelleZahl::ErstelleZahl(const char *string_ptr) {
    variable = std::string(string_ptr);
}
