FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/tensorflow-inference:1.14.0-cpu

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        libhdf5-dev \
        libcurl3-dev \
        libgtk2.0-0 \
        pkg-config \
        python3-dev \
        python3-pip \
        rsync \
        software-properties-common \
        unzip \
        gzip \
        wget \
        vim \
        git \
        nginx \
        ca-certificates \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*