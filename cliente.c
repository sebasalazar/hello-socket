#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 

#include "error_socket.h"

int main(int argc, char *argv[]) {
    int descriptor;
    int puerto;
    int n;
    struct sockaddr_in serv_addr;
    struct hostent *servidor;

    char buffer[512];
    if (argc < 3) {
        fprintf(stderr, "Error en el uso: %s servidor puerto\n", argv[0]);
        exit(1);
    }

    sscanf(argv[2], "%d", &puerto);

    descriptor = socket(AF_INET, SOCK_STREAM, 0);
    if (descriptor < 0) {
        error("ERROR al abrir socket");
    }

    servidor = gethostbyname(argv[1]);
    if (servidor == NULL) {
        fprintf(stderr, "ERROR, no existe servidor\n");
        exit(1);
    }

    bzero((char *) &serv_addr, sizeof (serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *) servidor->h_addr, (char *) &serv_addr.sin_addr.s_addr, servidor->h_length);
    serv_addr.sin_port = htons(puerto);

    if (connect(descriptor, (struct sockaddr *) &serv_addr, sizeof (serv_addr)) < 0) {
        error("ERROR de conexion");
    }
    
    printf("Ingrese el mensaje: ");
    bzero(buffer, 512);
    fgets(buffer, 511, stdin);
    n = write(descriptor, buffer, strlen(buffer));
    if (n < 0) {
        error("ERROR escribiendo en el socket");
    }

    bzero(buffer, 512);
    n = read(descriptor, buffer, 511);
    if (n < 0) {
        error("ERROR leyendo del socket");
    }
    printf("%s\n", buffer);
    close(descriptor);

    return (EXIT_SUCCESS);
}
