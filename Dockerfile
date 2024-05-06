FROM simbricks/simbricks-min:49294407d922
RUN apt-get update \
 && apt-get install -y \
	git \
	graphviz \
	python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install \
	graphviz \
	notebook \
	jupyterlab
ENV USER ${USERNAME}
ENV NB_UID ${USER_UID}
ENV HOME /home/${USERNAME}
COPY --chown=simbricks:simbricks . ${HOME}
WORKDIR ${HOME}
USER ${USERNAME}:${USERNAME}
CMD jupyter-lab --ip=0.0.0.0 --allow-root --LabApp.token=''
EXPOSE 8888/tcp
