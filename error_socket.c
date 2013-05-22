#include "error_socket.h"

void error(const char *msg) {
    perror(msg);
    exit(1);
}

