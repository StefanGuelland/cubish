//
// Created by sguelland on 16.01.18.
//

#ifndef CUBISH_ARTNET_CLIENT_H
#define CUBISH_ARTNET_CLIENT_H

#include <stdint.h>
#include <stdio.h>

extern "C" int artnet_client_init(void);
extern "C" void artnet_client_deinit(void);

extern "C" void artnet_client_send(uint8_t* buffer, ssize_t len);



#endif //CUBISH_ARTNET_CLIENT_H
