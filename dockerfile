FROM nvidia/cuda:10.2-base

WORKDIR /home

RUN apt update
RUN apt install -y htop wget tmux git python3-pip vim
