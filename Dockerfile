FROM flink:1.8

# S3
RUN mv $FLINK_HOME/opt/flink-s3-fs-presto-1.8.0.jar $FLINK_HOME/lib
# Copy Prometheus and PrometheusPushGateway 
RUN mv $FLINK_HOME/opt/flink-metrics-prometheus-*.jar $FLINK_HOME/lib
RUN mv $FLINK_HOME/opt/flink-metrics-influxdb-*.jar $FLINK_HOME/lib
# Graphite
RUN mv $FLINK_HOME/opt/flink-metrics-graphite-*.jar $FLINK_HOME/lib

# InfluxDB
RUN mv $FLINK_HOME/opt/flink-metrics-influxdb-*.jar $FLINK_HOME/lib

# SatsD
RUN mv $FLINK_HOME/opt/flink-metrics-statsd-*.jar $FLINK_HOME/lib

# Datadog 
RUN mv $FLINK_HOME/opt/flink-metrics-datadog-*.jar $FLINK_HOME/lib

# sl4j
RUN mv $FLINK_HOME/opt/flink-metrics-slf4j-*.jar $FLINK_HOME/lib
