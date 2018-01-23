//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_CUBE_H
#define CUBISH_CUBE_H


#include <cstdint>

class Cube {
public:
    struct CubeColor {
        uint8_t red;
        uint8_t green;
        uint8_t blue;
    };
public:

    void anzeigen(void);
    void faerbeCube(CubeColor color);
    static class Cube singleton;

private:
    CubeColor framebuffer[5][5][5];
};


#endif //CUBISH_CUBE_H
