FROM nvidia/cuda:10.2-base

ENV PATH="/opt/conda/bin:${PATH}"
ARG PATH="/opt/conda/bin:${PATH}"

WORKDIR /home

RUN rm /etc/apt/sources.list.d/cuda.list && \
RUN rm /etc/apt/sources.list.d/nvidia-ml.list && \
RUN apt-key del 7fa2af80 && \
RUN apt-get update && apt-get install -y --no-install-recommends wget && \
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb && \
RUN dpkg -i cuda-keyring_1.0-1_all.deb && \
RUN apt-get update

RUN apt update
RUN apt install -y htop wget tmux git python3-pip vim
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
RUN bash Miniconda3-py39_4.10.3-Linux-x86_64.sh -b -p /opt/conda
RUN rm -f Miniconda3-py39_4.10.3-Linux-x86_64.sh

RUN conda install -y pytorch==1.9 cudatoolkit=10.2 -c pytorch
RUN conda install -y matplotlib

RUN mkdir /data

RUN wget https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v2.0.json
RUN wget https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v2.0.json