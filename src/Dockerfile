ARG HADOOP_VERSION=""
ARG JAVA_VERSION=""

FROM mpolatcan/hadoop:${HADOOP_VERSION}-java${JAVA_VERSION}

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

ARG GIRAPH_VERSION="1.3.0"
ARG GIRAPH_HADOOP_VERSION="2"
ARG GIRAPH_ZIP_FOLDER_NAME_PREFIX="giraph-${GIRAPH_VERSION}-hadoop${GIRAPH_HADOOP_VERSION}"
ARG GIRAPH_DOWNLOAD_LINK="https://downloads.apache.org/giraph/giraph-${GIRAPH_VERSION}/giraph-dist-${GIRAPH_VERSION}-hadoop${GIRAPH_HADOOP_VERSION}-bin.tar.gz"

ENV GIRAPH_HOME="${HDUSER_HOME}/giraph"
ENV PATH=$PATH:$GIRAPH_HOME/bin

USER root
RUN wget ${GIRAPH_DOWNLOAD_LINK} && \
    tar -xvzf giraph-dist-${GIRAPH_VERSION}-hadoop${GIRAPH_HADOOP_VERSION}-bin.tar.gz -C ${HDUSER_HOME} && \
    mkdir -p ${GIRAPH_HOME} && \
    mv ${GIRAPH_ZIP_FOLDER_NAME_PREFIX}-*/* ${GIRAPH_HOME} && \
    rm -r ${GIRAPH_ZIP_FOLDER_NAME_PREFIX}-* \
          giraph-dist-${GIRAPH_VERSION}-hadoop${GIRAPH_HADOOP_VERSION}-bin.tar.gz&& \
    chown -R hduser:hadoop ${GIRAPH_HOME}

USER hduser
ENTRYPOINT ["./hadoop_entrypoint.sh", "hadoop"]

