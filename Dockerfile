FROM debian:stretch
LABEL maintainer="Brian May <brian@linuxpenguins.xyz>"

RUN apt-get update -q --fix-missing && \
  apt-get -y upgrade && \
  apt-get -y install socat openssh-server && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 22 80

RUN useradd -ms /bin/bash user
VOLUME "/home/user"

COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
