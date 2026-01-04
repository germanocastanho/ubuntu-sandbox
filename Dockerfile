FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    ca-certificates \
    nano \
    && rm -rf /var/lib/apt/lists/*

ARG SANDBOX_USER
ARG SANDBOX_PASSWORD

RUN useradd -m -s /bin/bash ${SANDBOX_USER}
RUN usermod -aG sudo ${SANDBOX_USER}
RUN echo "${SANDBOX_USER}:${SANDBOX_PASSWORD}" | chpasswd

RUN echo "export PS1=\"\u@sandbox:\w\$ \"" >> /home/${SANDBOX_USER}/.bashrc

USER ${SANDBOX_USER}
WORKDIR /home/${SANDBOX_USER}

CMD ["/bin/bash"]