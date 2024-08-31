FROM debian:bullseye-slim AS base
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get update && \
    apt-get install -y curl sudo git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS prime
ARG TAGS

RUN addgroup --gid 1000 zxus
RUN adduser --gecos zxus --uid 1000 --gid 1000 --disabled-password zxus
RUN echo "zxus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER zxus
WORKDIR /home/zxus

FROM prime
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS playbook.yml"]
#
# RUN pip3 install ansible
#
# RUN useradd -m zxus && echo "zxus:zxus" | chpasswd && adduser zxus sudo
#
# RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo
#
# RUN echo "ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible
#
# USER ansible
#
# WORKDIR /home/ansible
#
# COPY . .
#
# CMD ["ansible-playbook", "playbook.yml"]
