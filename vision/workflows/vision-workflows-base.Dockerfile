FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ADD . /install
WORKDIR /install

# Install linux packages
WORKDIR /install
RUN apt-get update \
    && xargs -a linux-packages.txt apt-get install -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download nltk data
RUN mkdir /root/nltk_data
RUN mkdir /root/nltk_data/misc
RUN wget https://raw.githubusercontent.com/nltk/nltk_data/gh-pages/packages/misc/perluniprops.zip
RUN unzip -d /root/nltk_data/misc/ perluniprops.zip
RUN mkdir /root/nltk_data/tokenizers
RUN wget https://raw.githubusercontent.com/nltk/nltk_data/gh-pages/packages/tokenizers/punkt.zip
RUN unzip -d /root/nltk_data/tokenizers/ punkt.zip
RUN mkdir /root/nltk_data/corpora
RUN wget https://raw.githubusercontent.com/nltk/nltk_data/gh-pages/packages/corpora/words.zip
RUN unzip -d /root/nltk_data/corpora/ words.zip

# Install swig
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN wget http://prdownloads.sourceforge.net/swig/swig-3.0.12.tar.gz && tar -xzvf swig-3.0.12.tar.gz
RUN mkdir -p /sw/swigtool && cd /install/swig-3.0.12 && ./configure --prefix=/sw/swigtool && make && make install
ENV PATH="/sw/swigtool/bin:${PATH}"

# Set python
RUN cd /usr/local/bin && ln -s /usr/bin/python3 python && ln -s /usr/bin/pip3 pip

# Install python packages
RUN pip install -r python-requirements.txt

# Purge cache and temp folders
RUN rm -rf /var/cache/apt/*
RUN rm -rf /install