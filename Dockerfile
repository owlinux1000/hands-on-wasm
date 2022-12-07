FROM ubuntu:22.04
LABEL maintainer "Chihiro Hasegawa <encry1024@gmail.com>"

WORKDIR /root

RUN apt-get -qq -y update && \
    apt-get -qq -y install python3-minimal git xz-utils bzip2 bash-completion binutils

RUN git clone https://github.com/oreilly-japan/WebAssembly && \
    git clone https://github.com/emscripten-core/emsdk.git

RUN /root/emsdk/emsdk install latest && \
    /root/emsdk/emsdk activate latest && \
    echo 'source /root/emsdk/emsdk_env.sh' >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]