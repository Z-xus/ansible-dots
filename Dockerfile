FROM debian:bullseye-slim AS base
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install ansible

RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo

RUN echo "ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible

USER ansible

WORKDIR /home/ansible

COPY . .

CMD ["ansible-playbook", "playbook.yml"]
