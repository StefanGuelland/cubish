//
// Created by sguelland on 16.01.18.
//

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <memory.h>

#include <stdbool.h>
#define AnsiString char //quick fix
#include "Art-Net.h"

#define MAXBUF 65536

#define str(s) #s

static const char* port = "6454";
        //str(DefaultPort);
static const char* host = "255.255.255.255";

static int sock;
static struct addrinfo *psinfo;
static int sin6len;


int artnet_client_init(void)
{
    int status;
    struct addrinfo sainfo;
    struct sockaddr_in6 sin6;

    sin6len = sizeof(struct sockaddr_in6);

    sock = socket(PF_INET6, SOCK_DGRAM,0);

    memset(&sin6, 0, sizeof(struct sockaddr_in6));
    sin6.sin6_port = htons(0);
    sin6.sin6_family = AF_INET6;
    sin6.sin6_addr = in6addr_any;

    status = bind(sock, (struct sockaddr *)&sin6, sin6len);

    if(-1 == status)
        perror("bind"), exit(1);

    /* Set socket to allow broadcast */
    int broadcastPermission = 1;
    if (setsockopt(sock, SOL_SOCKET, SO_BROADCAST, (void *) &broadcastPermission,
                   sizeof(broadcastPermission)) < 0)
        printf("setsockopt() failed");

    memset(&sainfo, 0, sizeof(struct addrinfo));
    memset(&sin6, 0, sin6len);

    sainfo.ai_flags = AI_NUMERICSERV; // 0;
    sainfo.ai_family = PF_INET; // PF_INET6;
    sainfo.ai_socktype = SOCK_DGRAM;
    sainfo.ai_protocol = IPPROTO_UDP;
    status = getaddrinfo(host, port, &sainfo, &psinfo);

    switch (status)
    {
        case EAI_FAMILY: printf("family\n");
            break;
        case EAI_SOCKTYPE: printf("stype\n");
            break;
        case EAI_BADFLAGS: printf("flag\n");
            break;
        case EAI_NONAME: printf("noname\n");
            break;
        case EAI_SERVICE: printf("service\n");
            break;
    }

    return 0;
}

void artnet_client_send(uint8_t* buffer, ssize_t len) {
    int status;

    T_ArtDmx packet;
    memset(&packet,0,sizeof(packet));
    strcpy((char *)&(packet.ID),"Art-Net");
    packet.OpCode = OpOutput;
    memcpy(&(packet.Data), buffer, len);
    packet.Length = len;
    packet.SubUni = 42 -1;

    int packet_len = sizeof(packet) - MaxDataLength + len;

    status = sendto(sock, &packet, packet_len, 0,
                    (struct sockaddr *)psinfo->ai_addr, sin6len);
}


void artnet_client_deinit(void)
{
    // free memory
    freeaddrinfo(psinfo);
    psinfo = NULL;

    shutdown(sock, 2);
    close(sock);
}