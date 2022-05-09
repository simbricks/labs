#!/bin/sh
docker run --rm -it \
    -p8888:8888 \
    -v /dev/kvm:/dev/kvm \
    simbricks/simbricks-jupyter
