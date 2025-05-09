FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y sysbench && \
    rm -rf /var/lib/apt/lists/*

CMD ["sysbench", "cpu", "--threads=2", "run"]
