//
// Created by sguelland on 18.01.18.
//

#include "Warte.h"
#include <unistd.h>
#include <iostream>

ParseTree::Warte::Warte(int zeit_) {

}

void ParseTree::Warte::Execute(void) {
    std::cout << "Warte ..." << std::endl;
    usleep(1000000 * 3);
    std::cout << "... Warte vorbei" << std::endl;
}
