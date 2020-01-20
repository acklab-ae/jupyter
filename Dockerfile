FROM debian:latest

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y curl default-jre scala \
    build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev \
    libffi-dev wget git python3 python3-pip python-setuptools python3-setuptools && \
    rm -rf /var/lib/apt/lists* && \
    pip3 install --upgrade pip && \

#setting up spark
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    curl -O http://archive.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz && \
    tar -zxvf spark-2.0.0-bin-hadoop2.7.tgz && \
    mv spark-2.0.0-bin-hadoop2.7 /spark && \
    rm spark-2.0.0-bin-hadoop2.7.tgz

#setting up environment variables
ENV SPARK_HOME='/spark'
ENV PATH=$SPARK_HOME:$PATH
ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
ENV JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'

#sourcing the environment variables
RUN mkdir -p /home/jupyter && \
    git clone https://github.com/acklab-ae/jupyter.git /home/jupyter
    source ~/.bashrc

WORKDIR /home/jupyter/

# Download and execute post processing scripts
RUN chmod a+x /home/jupyter/ds.sh && sh /home/jupyter/ds.sh

#sourcing the environment variables
RUN source ~/.bashrc && \
    apt-get clean

#Running jupyter by default
CMD ["sh","-c","jupyter notebook --ip 0.0.0.0 --allow-root --no-browser"]
