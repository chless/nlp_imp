FROM nvidia/cuda:10.2-base

ENV PATH="/opt/conda/bin:${PATH}"
ARG PATH="/opt/conda/bin:${PATH}"

WORKDIR /home

RUN apt update
RUN apt install -y htop wget tmux git python3-pip vim
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
RUN bash Miniconda3-py39_4.10.3-Linux-x86_64.sh -b -p /opt/conda
RUN rm -f Miniconda3-py39_4.10.3-Linux-x86_64.sh

RUN conda install -y pytorch==1.9 cudatoolkit=10.2 -c pytorch
RUN conda install -y matplotlib

RUN mkdir /data
