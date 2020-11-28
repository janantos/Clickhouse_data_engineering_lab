FROM ubuntu:latest
ARG SSH_USER=lab
ARG SSH_PASS=lab
ARG SSH_NODE_INSTALL=""
RUN apt-get -y update && \
    apt-get -y --no-install-recommends install --fix-missing openssh-server \
	openssl wget apt-transport-https ca-certificates dirmngr gnupg tzdata\
	sudo $SSH_NODE_INSTALL
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E0C56BD4
RUN echo "deb https://repo.clickhouse.tech/deb/stable/ main/" | tee \
    /etc/apt/sources.list.d/clickhouse.list
RUN apt-get update
RUN apt-get install -y clickhouse-client
RUN wget -P /usr/local/bin/ https://github.com/amacneil/dbmate/releases/latest/download/dbmate-linux-amd64
RUN chmod a+x /usr/local/bin/dbmate-linux-amd64
RUN ln -s /usr/local/bin/dbmate-linux-amd64 /usr/local/bin/dbmate
RUN useradd -m -s /bin/bash -p $(openssl passwd -1 $SSH_PASS) $SSH_USER
RUN usermod -aG sudo $SSH_USER
RUN sed -i 's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

