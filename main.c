/* 
 * File:   main.c
 * Author: Sebastián Salazar Molina <sebasalazar@gmail.com>
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>

void error(const char *msg);

int main(int argc, char** argv) {

    int descriptor = -1;
    int nuevo_socket = -1;
    int puerto = 1985;

    socklen_t clilen;
    char buffer[512];
    struct sockaddr_in serv_addr, cli_addr;
    int n;

    descriptor = socket(AF_INET, SOCK_STREAM, 0);
    if (descriptor < 0) {
        error("ERROR opening socket");
    }

    bzero((char *) &serv_addr, sizeof (serv_addr));

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(puerto);

    if (bind(descriptor, (struct sockaddr *) &serv_addr, sizeof (serv_addr)) < 0) {
        error("ERROR al bindear puerto # Probablemente el puerto esté ocupado");
    }

    listen(descriptor, 5);
    clilen = sizeof (cli_addr);

    nuevo_socket = accept(descriptor, (struct sockaddr *) &cli_addr, &clilen);
    if (nuevo_socket < 0) {
        error("ERROR al aceptar");
    }
    bzero(buffer, 256);
    n = read(nuevo_socket, buffer, 255);
    if (n < 0) {
        error("ERROR al leer desde el socket");
    }
    printf("Mensaje: %s a las %s %s\n", buffer, __DATE__, __TIME__);
    n = write(nuevo_socket, "recibi el mensaje", 18);
    if (n < 0) {
        error("ERROR al escribir en socket");
    }
    close(nuevo_socket);
    close(descriptor);

    return (EXIT_SUCCESS);
}

void error(const char *msg) {
    perror(msg);
    exit(1);
}
