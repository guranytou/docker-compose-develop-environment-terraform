#!/bin/bash

set -e

##############################################################################
# Variables
##############################################################################

if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
    echo "${AWS_ACCESS_KEY_ID}"
	echo "Require Environment Variables: AWS_ACCESS_KEY_ID"
    exit 1
fi

if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
    echo "${AWS_SECRET_ACCESS_KEY}"
	echo "Require Environment Variables: AWS_SECRET_ACCESS_KEY"
    exit 1
fi

if [ -z "${AWS_REGION}" ]; then
    echo "${AWS_REGION}"
	echo "Require Environment Variables: AWS_REGION"
    exit 1
fi

##############################################################################
# Create credential file
##############################################################################
{
    echo "[profile default]"
    echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
    echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
} >> /root/.aws/credentials

{
    echo "[profile default_role]"
    echo "AWS_REGION=$AWS_REGION"
} >> /root/.aws/config

echo $AWS_ACCESS_KEY_ID

exec "$@"