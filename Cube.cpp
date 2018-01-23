//
// Created by sguelland on 22.01.18.
//

#include "Cube.h"
#include "artnet_client.h"

void Cube::anzeigen(void) {
    artnet_client_send((uint8_t*)framebuffer, sizeof(framebuffer));
}

void Cube::faerbeCube(Cube::CubeColor color) {
    for(int i = 0; i < 5*5*5;i++)
        framebuffer[0][0][i] = color;
}

Cube Cube::singleton = Cube();