### Data Engineering Lab
- redis
- clickhouse (2 shards, 2 replicas each, tiered s3 disk)
- postgres
- minio
- apache airflow
- ssh jumpbox with dbmate, psql, s3cmd, clickhouse-client, tmux, python3 and vim installed
- kafka

#### Network config

| container name    | IP Address  |
| --------------    | ----------  |
| redis             | 172.23.0.20 |
| postgres          | 172.23.0.40 |
| zookeeper         | 172.23.0.10 |
| kafka01           | 172.23.0.50 |
| jumpbox           | 172.23.0.40 |
| airflow-scheduler | 172.23.0.60 |
| airflow-webserver | 172.23.0.61 |
| minios3           | 172.23.0.90 |
| clickhouse01      | 172.23.0.11 |
| clickhouse02      | 172.23.0.12 |
| clickhouse03      | 172.23.0.13 |
| clickhouse04      | 172.23.0.14 |

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

