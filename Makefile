.PHONY: help
help:
	@echo "HELP:"
	@echo "make config - Generate config files"
	@echo "make up - Initialize lab"
	@echo "make down - Remove lab containers"
	@echo "make start - Start lab"
	@echo "make stop - Stop lab"
	@echo "make clear - Remove lab containers, remove configs & docker images"
	@echo "make remove_known_hosts - Remove localhost:2222 from ssh known hosts"
	@echo "make attach_shell c=container_name - Attach to running container shell"

.PHONY: config
config:
	@mkdir -p config/clickhouse0{1..4} \
		minio-data/clickhouse0{1..4} \
		jumpbox_home airflow-logs
		

	@REPLICA=01 SHARD=01 envsubst < config.xml > config/clickhouse01/config.xml
	@REPLICA=02 SHARD=01 envsubst < config.xml > config/clickhouse02/config.xml
	@REPLICA=03 SHARD=02 envsubst < config.xml > config/clickhouse03/config.xml
	@REPLICA=04 SHARD=02 envsubst < config.xml > config/clickhouse04/config.xml
	@cp users.xml config/clickhouse01/users.xml
	@cp users.xml config/clickhouse02/users.xml
	@cp users.xml config/clickhouse03/users.xml
	@cp users.xml config/clickhouse04/users.xml
	@cp .s3cfg jumpbox_home
  @sudo chmod -R  50000:root airflow-*
	

.PHONY: up
up:
	@docker-compose up -d

.PHONY: up_rebuild
up_rebuild:
	@docker-compose up -d --build --force-recreate

.PHONY: start
start:
	@docker-compose start

.PHONY: stop
stop:
	@docker-compose stop 

.PHONY: down
down:
	@docker-compose down

.PHONY: clear
clear:
	@docker-compose down --rmi all -v
	@rm -rf config
	@rm -rf minio-data
	@rm -rf jumpbox_home
	@sudo rm -rf airflow-logs
	@ssh-keygen -R "[localhost]:2222"

.PHONY: remove_known_hosts
remove_known_hosts:
	@ssh-keygen -R "[localhost]:2222"

.PHONY: attach_shell
attach_shell:
	@docker exec -ti $(c) /bin/sh

.PHONY: restart_clickhouse
restart_clickhouse:
	@docker-compose stop clickhouse01
	@docker-compose stop clickhouse02
	@docker-compose stop clickhouse03
	@docker-compose stop clickhouse04
	@sleep 2
	@docker-compose start clickhouse01
	@docker-compose start clickhouse02
	@docker-compose start clickhouse03
	@docker-compose start clickhouse04

.PHONY: restart_clickhouse_nodes
restart_clickhouse_nodes:
	@docker-compose stop clickhouse01
	@docker-compose start clickhouse01
	@docker-compose stop clickhouse02
	@docker-compose start clickhouse02
	@docker-compose stop clickhouse03
	@docker-compose start clickhouse03
	@docker-compose stop clickhouse04
	@docker-compose start clickhouse04

