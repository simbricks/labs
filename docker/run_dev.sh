#!/bin/sh
docker run --rm -it \
    -p8888:8888 \
    -v `pwd`:/simbricks/labs/ \
    --device=/dev/kvm \
    simbricks/simbricks-jupyter
