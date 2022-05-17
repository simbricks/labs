# Interactive Introduction to SimBricks

**Quick Start:**
We provide a docker image ready to run the labs on docker hub as
[`simbricks/labs`](https://hub.docker.com/repository/docker/simbricks/labs).
To run the container run:
```
docker run --rm -it -p8888:8888 --device=/dev/kvm simbricks/simbricks-jupyter
```
and then open
[http://127.0.0.1:8888/lab/tree/labs/lab1.ipynb](http://127.0.0.1:8888/lab/tree/labs/lab1.ipynb)
in your local browser.

`--device=/dev/kvm` is optional to accelerate KVM-based
simulations in the guest, but also requires kvm support and appropriate
permissions for `/dev/kvm`. If your system does not support kvm, just skip this.

