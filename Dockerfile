# Check http://releases.llvm.org/download.html#9.0.0 for the latest available binaries
FROM ubuntu:18.04

RUN echo "Acquire::http::proxy \"http://10.158.100.126:8080/\";\nAcquire::https::proxy \"http://10.158.100.126:8080/\";" > /etc/apt/apt.conf
RUN cat /etc/apt/apt.conf
COPY sources.list /etc/apt/sources.list

# Make sure the image is updated, install some prerequisites,
# Download the latest version of Clang (official binary) for Ubuntu
# Extract the archive and add Clang to the PATH
RUN apt-get update && apt-get install -y \
  xz-utils \
  build-essential \
  curl

RUN rm -rf /var/lib/apt/lists/*
RUN curl -SL http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz --proxy 10.144.1.10:8080| tar -xJC .
RUN mv clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_9.0.0
RUN echo 'export PATH=/clang_9.0.0/bin:$PATH' >> ~/.bashrc
RUN echo 'export LD_LIBRARY_PATH=/clang_9.0.0/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

# Start from a Bash prompt
CMD [ "/bin/bash" ]
