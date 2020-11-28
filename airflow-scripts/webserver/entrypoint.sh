#!/usr/bin/env bash
pip install -U airflow-clickhouse-plugin --user
airflow initdb
airflow webserver

