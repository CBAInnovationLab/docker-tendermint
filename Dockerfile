FROM ubuntu:xenial
MAINTAINER dan.turner@cba.com.au

WORKDIR /tmp

RUN apt-get update \
	&& apt-get install -y sudo wget unzip\
	&& echo "tendermint ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN wget https://github.com/tendermint/tendermint/releases/download/v0.14.0/tendermint_0.14.0_linux_amd64.zip \
 && unzip tendermint_0.14.0_linux_amd64.zip \
 && mv tendermint /usr/local/bin \
 && rm -rf tmp/* \
 && useradd -ms /bin/bash -G sudo tendermint

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER tendermint

WORKDIR /home/tendermint

EXPOSE 46656

VOLUME /home/tendermint

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
