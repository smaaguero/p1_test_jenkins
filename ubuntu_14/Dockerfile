FROM ubuntu:16.04
MAINTAINER saguero

#create a new user called docker with docker password
RUN useradd docker && echo "docker:docker" | chpasswd

# Install SSH and get bound to it.
RUN apt update
RUN apt -y install openssh-server
CMD ["/usr/sbin/sshd", "-D"]
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd
