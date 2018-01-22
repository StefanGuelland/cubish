//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include <artnet_client.h>
#include <cstring>
#include <Cube.h>
#include "Anzeigen.h"

ParseTree::Anzeigen::Anzeigen() {

}

void ParseTree::Anzeigen::Execute(void) {

    std::cout
            << "\tRendere Cube Bild... "
            << std::endl;

//    uint8_t buffer[3*5*5*5];
//    memset(buffer,50,sizeof(buffer));
//    artnet_client_send(buffer, sizeof(buffer));
    Cube::singleton.anzeigen();
}

