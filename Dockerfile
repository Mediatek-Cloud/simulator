FROM ubuntu:16.04

LABEL maintainer="Bo-Yi Wu <appleboy.tw@gmail.com>"

RUN apt-get -y update
RUN apt-get -y install python-pip python-dev build-essential software-properties-common wget locales libc6-i386
RUN pip install --upgrade pip
RUN pip install numpy
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN apt-get -y update && apt-get -y install python3.6
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.6 get-pip.py && python3.6 -m pip install numpy
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8
# Add zip command
RUN apt-get -y install zip
# Add expect for petrus
RUN apt-get -y install expect
# Add vim for debug
RUN apt-get -y install vim

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
