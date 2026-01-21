# Some parts are copied from dagster guide
# https://docs.dagster.io/guides/deploy/deployment-options/docker
# Dagster server and daemon image
FROM python:3.14-slim

RUN pip install \
    dagster==1.12.11  \
    dagster-docker==0.28.11  \
    dagster-graphql==1.12.11  \
    dagster-postgres==0.28.11  \
    dagster-webserver==1.12.11  \
    dagster-aws==0.28.11 \
    aiohttp==3.13.3

ENV DAGSTER_HOME=/opt/dagster/dagster_home/

RUN mkdir -p $DAGSTER_HOME

COPY dagster.yaml $DAGSTER_HOME/dagster.yaml
COPY workspace.yaml $DAGSTER_HOME/workspace.yaml

WORKDIR $DAGSTER_HOME
