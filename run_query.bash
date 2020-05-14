#!/bin/bash

BD_HOST=${BD_HOST:-ec2-18-217-189-8.us-east-2.compute.amazonaws.com}
POSTGRESQL_PORT=${POSTGRESQL_PORT:-55436}

QUERY_FILE=$1
shift

psql -U blackduck_reporter -h ${BD_HOST} -p ${POSTGRESQL_PORT} bds_hub -f ${QUERY_FILE} $*


