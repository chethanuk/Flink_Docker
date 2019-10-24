FROM flink:1.8
# docker build -t chethanuk/flink:1.8 .
# docker build -t chethanuk/flink:1.8 .

# # S3
# RUN mv $FLINK_HOME/opt/flink-s3-fs-presto-*.jar $FLINK_HOME/lib
# RUN mv $FLINK_HOME/opt/flink-s3-fs-hadoop-*.jar $FLINK_HOME/lib

# # Copy Prometheus and PrometheusPushGateway 
# RUN mv $FLINK_HOME/opt/flink-metrics-prometheus-*.jar $FLINK_HOME/lib
# # Graphite
# RUN mv $FLINK_HOME/opt/flink-metrics-graphite-*.jar $FLINK_HOME/lib
# # InfluxDB
# RUN mv $FLINK_HOME/opt/flink-metrics-influxdb-*.jar $FLINK_HOME/lib
# # SatsD
# RUN mv $FLINK_HOME/opt/flink-metrics-statsd-*.jar $FLINK_HOME/lib
# # Datadog 
# RUN mv $FLINK_HOME/opt/flink-metrics-datadog-*.jar $FLINK_HOME/lib
# # sl4j
# RUN mv $FLINK_HOME/opt/flink-metrics-slf4j-*.jar $FLINK_HOME/lib

# # SQL Client flink-sql-client
# RUN mv $FLINK_HOME/opt/flink-sql-*.jar $FLINK_HOME/lib
# # flink-table
# RUN mv $FLINK_HOME/opt/flink-table*.jar $FLINK_HOME/lib

# # Flink-python
# RUN mv $FLINK_HOME/opt/flink-python*.jar $FLINK_HOME/lib
# # flink-streaming-python
# RUN mv $FLINK_HOME/opt/flink-streaming-python*.jar $FLINK_HOME/lib

# # Flink-queryable-state
# RUN mv $FLINK_HOME/opt/flink-queryable-state*.jar $FLINK_HOME/lib

# # flink-ml
# RUN mv $FLINK_HOME/opt/flink-ml*.jar $FLINK_HOME/lib
#  $FLINK_HOME/opt/flink-s3-fs-presto-*.jar
RUN mv $FLINK_HOME/opt/flink-s3-fs-hadoop-*.jar $FLINK_HOME/opt/flink-s3-fs-presto-*.jar $FLINK_HOME/opt/flink-metrics-prometheus-*.jar $FLINK_HOME/opt/flink-metrics-graphite-*.jar $FLINK_HOME/opt/flink-metrics-influxdb-*.jar $FLINK_HOME/opt/flink-metrics-statsd-*.jar $FLINK_HOME/opt/flink-metrics-datadog-*.jar $FLINK_HOME/opt/flink-metrics-slf4j-*.jar $FLINK_HOME/opt/flink-sql-*.jar $FLINK_HOME/opt/flink-table*.jar $FLINK_HOME/opt/flink-python*.jar $FLINK_HOME/opt/flink-streaming-python*.jar $FLINK_HOME/opt/flink-queryable-state*.jar $FLINK_HOME/opt/flink-ml*.jar $FLINK_HOME/lib
