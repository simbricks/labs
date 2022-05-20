#!/bin/sh
docker run --rm -it \
    -p8888:8888 \
    --device=/dev/kvm \
    simbricks/simbricks-jupyter
