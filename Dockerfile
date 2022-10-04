FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install deps
RUN apt-get update && \
    apt-get install -y bash \
    git \
    tzdata \
    curl \
    zip \
    python \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common \
    lsb-release \
    gnupg

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get install -y docker-ce-cli

# Install AWS CLI
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm get-pip.py && \
    pip install --upgrade pip && \
    pip install awscli --upgrade
