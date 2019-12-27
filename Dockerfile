ARG FLINK_VERSION
ARG SCALA_VERSION
FROM flink:${FLINK_VERSION}-scala_${SCALA_VERSION}
ARG FLINK_HADOOP_VERSION
ARG GCS_CONNECTOR_VERSION


# RUN mv $FLINK_HOME/opt/flink-ml*.jar $FLINK_HOME/lib
#  $FLINK_HOME/opt/flink-s3-fs-presto-*.jar
RUN mv $FLINK_HOME/opt/flink-s3-fs-hadoop-*.jar $FLINK_HOME/opt/flink-s3-fs-presto-*.jar $FLINK_HOME/opt/flink-metrics-prometheus-*.jar $FLINK_HOME/opt/flink-metrics-graphite-*.jar $FLINK_HOME/opt/flink-metrics-influxdb-*.jar $FLINK_HOME/opt/flink-metrics-statsd-*.jar $FLINK_HOME/opt/flink-metrics-datadog-*.jar $FLINK_HOME/opt/flink-metrics-slf4j-*.jar $FLINK_HOME/opt/flink-sql-*.jar $FLINK_HOME/opt/flink-python*.jar $FLINK_HOME/opt/flink-queryable-state*.jar $FLINK_HOME/lib

RUN test -n "$FLINK_VERSION"
RUN test -n "$FLINK_HADOOP_VERSION"
RUN test -n "$GCS_CONNECTOR_VERSION"

ARG GCS_CONNECTOR_NAME=gcs-connector-${GCS_CONNECTOR_VERSION}.jar
ARG GCS_CONNECTOR_URI=https://storage.googleapis.com/hadoop-lib/gcs/${GCS_CONNECTOR_NAME}
ARG FLINK_HADOOP_JAR_NAME=flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar
ARG FLINK_HADOOP_JAR_URI=https://repo.maven.apache.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/${FLINK_HADOOP_VERSION}/${FLINK_HADOOP_JAR_NAME}

# Download and configure GCS connector.
# When running on GKE, there is no need to enable and include service account
# key file, GCS connector can get credential from VM metadata server.
RUN echo "Downloading ${GCS_CONNECTOR_URI}" && \
  wget -q -O /opt/flink/lib/${GCS_CONNECTOR_NAME} ${GCS_CONNECTOR_URI}
RUN echo "Downloading ${FLINK_HADOOP_JAR_URI}" && \
  wget -q -O /opt/flink/lib/${FLINK_HADOOP_JAR_NAME} ${FLINK_HADOOP_JAR_URI}

# $FLINK_HOME/opt/flink-s3-fs-hadoop-*.jar 
RUN mv $FLINK_HOME/opt/flink-s3-fs-presto-*.jar $FLINK_HOME/opt/flink-metrics-prometheus-*.jar  $FLINK_HOME/opt/flink-metrics-slf4j-*.jar $FLINK_HOME/opt/flink-sql-*.jar $FLINK_HOME/opt/flink-table*.jar $FLINK_HOME/opt/flink-python*.jar $FLINK_HOME/opt/flink-streaming-python*.jar $FLINK_HOME/opt/flink-queryable-state*.jar $FLINK_HOME/opt/flink-ml*.jar $FLINK_HOME/lib
