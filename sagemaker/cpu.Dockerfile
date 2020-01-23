FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/tensorflow-inference:1.14.0-cpu

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libglib2.0 \
        libsm6 \
        libtesseract-dev \
        libxext6 \
        libgtk2.0-0 \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ${PIP} install --no-cache-dir \
    tensorflow-serving-api==1.14.0 \
    tensorflow==1.14.0 \
    opencv-python==3.4.3.18 \
    scipy>=1.1.0