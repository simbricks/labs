FROM simbricks/simbricks-min:latest
RUN apt-get update \
 && apt-get install -y \
	git \
	graphviz \
	python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install \
	graphviz \
	jupyterlab
WORKDIR /simbricks
COPY --chown=simbricks:simbricks . /simbricks/labs
CMD jupyter-lab --ip=0.0.0.0 --allow-root --LabApp.token=''
EXPOSE 8888/tcp
