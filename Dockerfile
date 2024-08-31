FROM debian:bullseye-slim AS base
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/local/bin

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl sudo git ansible build-essential && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove --yes

FROM base AS prime

ARG TAGS

RUN addgroup --gid 1000 zxus && \
    adduser --gecos zxus --uid 1000 --gid 1000 --disabled-password zxus && \
    echo "zxus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER zxus
WORKDIR /home/zxus

COPY . .

CMD ["sh", "-c", "ansible-playbook ${TAGS:-all} playbook.yml"]
