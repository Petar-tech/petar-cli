#!/bin/bash

IFS='='

SERVICE_NAME="$(cat .env | grep SERVICE_NAME)"
CURRENT_NAME=""
for x in $SERVICE_NAME
do
	if [ "${x}" != "SERVICE_NAME" ]
	then
		CURRENT_NAME=$x
		break
	fi
done

echo "Service name: $CURRENT_NAME"

SERVICE_VERSION="$(cat .env | grep SERVICE_VERSION)"
CURRENT_VERSION=""
for x in $SERVICE_VERSION
do
	if [ "${x}" != "SERVICE_VERSION" ]
	then
		CURRENT_VERSION=$x
		break
	fi
done

DOCKER_HUB_ENV_USERNAME="$(cat .env | grep DOCKER_HUB_USERNAME)"
DOCKER_HUB_USERNAME=""
for x in $DOCKER_HUB_ENV_USERNAME
do
	if [ "${x}" != "DOCKER_HUB_USERNAME" ]
	then
		DOCKER_HUB_USERNAME=$x
		break
	fi
done

DOCKER_HUB_ENV_PASSWORD="$(cat .env | grep DOCKER_HUB_PASSWORD)"
DOCKER_HUB_PASSWORD=""
for x in $DOCKER_HUB_ENV_PASSWORD
do
	if [ "${x}" != "DOCKER_HUB_PASSWORD" ]
	then
		DOCKER_HUB_PASSWORD=$x
		break
	fi
done

eval "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
eval "docker build . -t $DOCKER_HUB_USERNAME/$CURRENT_NAME:$CURRENT_VERSION"
eval "docker push $DOCKER_HUB_USERNAME/$CURRENT_NAME:$CURRENT_VERSION"
