#!/bin/bash

NAME="blindmanager"

build() {
    docker build -t tonyyng/$NAME:latest $@ .
}

up() {
    docker run $@ \
        --name $NAME \
        -d \
        --restart unless-stopped \
        -v /etc/localtime:/etc/localtime \
        tonyyng/$NAME:latest
}

down() {
    docker rm -f -v $NAME
}

log() {
    docker logs $NAME $@
}

sh() {
    docker exec $@ -it $NAME bash
}

main() {
    Command=$1
    shift
    case "${Command}" in
        build | b)  build $@ ;;
        up | u)     up $@ ;;
        down | d)   down $@ ;;
        log | l)    log $@ ;;
        sh | s)     sh $@ ;;
        *)      echo "Usage: $0 {build|up|down|log|sh|b|u|d|l|s}" ;;
    esac
}

main $@
