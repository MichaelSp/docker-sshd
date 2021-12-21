FROM ubuntu:latest

RUN apt update && apt install -y openssh-server sudo && \
    useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 admin

RUN echo 'admin:test' | chpasswd
RUN service ssh start

EXPOSE 80

CMD ["/usr/sbin/sshd","-D", "-p", "80"]