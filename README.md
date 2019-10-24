# Flink Docker Image

Apache Flink is an open source stream processing framework with powerful stream- and batch-processing capabilities.

Learn more about Flink at https://flink.apache.org/

How to use this Docker image
Running a JobManager or a TaskManager
You can run a JobManager (master).

```bash
$ docker run --name flink_jobmanager -d -t flink jobmanager
```

You can also run a TaskManager (worker). Notice that workers need to register with the JobManager directly or via ZooKeeper so the master starts to send them tasks to execute.

```bash
$ docker run --name flink_taskmanager -d -t flink taskmanager
```

Running a cluster using Docker Compose
With Docker Compose you can create a Flink cluster:

```
version: "2.1"
services:
  jobmanager:
    image: ${FLINK_DOCKER_IMAGE_NAME:-flink}
    expose:
      - "6123"
    ports:
      - "8081:8081"
    command: jobmanager
    environment:
      - JOB_MANAGER_RPC_ADDRESS=jobmanager

  taskmanager:
    image: ${FLINK_DOCKER_IMAGE_NAME:-flink}
    expose:
      - "6121"
      - "6122"
    depends_on:
      - jobmanager
    command: taskmanager
    links:
      - "jobmanager:jobmanager"
    environment:
      - JOB_MANAGER_RPC_ADDRESS=jobmanager
```      

and just run docker-compose up.

Scale the cluster up or down to N TaskManagers:

```
docker-compose scale taskmanager=<N>
```

Configuration
These are the default ports used by the Flink image:

The Web Client is on port 8081
JobManager RPC port 6123
TaskManagers RPC port 6122
TaskManagers Data port 6121
