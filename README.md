### Data Engineering Lab
- redis
- clickhouse (2 shards, 2 replicas each, tiered s3 disk)
- postgres
- minio
- apache airflow
- ssh jumpbox with dbmate, psql, s3cmd, clickhouse-client, tmux, python3 and vim installed
- kafka

#### Network config

| container name    | IP Address  | Port |
| --------------    | ----------  | ---- |
| redis             | 172.23.0.20 |
| postgres          | 172.23.0.40 |
| zookeeper         | 172.23.0.10 |
| kafka01           | 172.23.0.50 |
| jumpbox           | 172.23.0.40 | 22(2222) |
| airflow-scheduler | 172.23.0.60 |
| airflow-webserver | 172.23.0.61 | 8080 |
| minios3           | 172.23.0.90 | 9000 |
| clickhouse01      | 172.23.0.11 | 9000 |
| clickhouse02      | 172.23.0.12 | 9000 |
| clickhouse03      | 172.23.0.13 | 9000 |
| clickhouse04      | 172.23.0.14 | 9000 |

#### Default passwords
##### jumpbox
username: lab  
password: lab  
##### redis
password: redis  
##### postgres
username: postgres  
password: postgres  
database: lab  
  
passwords can be changed in .env file

