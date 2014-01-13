#!/usr/bin/env objc-run

#import <stdio.h>

int main( int argc, const char *argv[] ) {
    for(int i=0; i < argc; i++) {
        printf("argv[%d]: %s\n", i, argv[i]);
    }
    return 0;
}
