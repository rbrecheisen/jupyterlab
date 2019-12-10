#!/bin/bash

PROJECT=${1}
if [ "${PROJECT}" == "" ]; then
	echo "Usage: createproject.sh <project name> <size> <password>"
	exit 1
fi

SIZE=${2}
if [ "${SIZE}" == "" ]; then
	echo "Usage: createproject.sh <project name> <size> <password>"
	exit 1
fi

PASSWORD=${3}
if [ "${PASSWORD}" == "" ]; then
	echo "Usage: createproject.sh <project name> <size> <password>"
	exit 1
fi

DATAVAULT_DIR=/home/rbrecheisen/datavault

DATAVAULT_MOUNT_DIR=/home/rbrecheisen/datavault-mounts

VOLUME_PATH=${DATAVAULT_DIR}/containers/${PROJECT}.hc

VOLUME_MOUNT_PATH=${DATAVAULT_MOUNT_DIR}/${PROJECT}

mkdir -p ${VOLUME_MOUNT_PATH}

sudo veracrypt -t -c \
	--volume-type=normal ${VOLUME_PATH} \
	--encryption=aes \
	--hash=sha-512 \
	--filesystem=ext4 \
	--password ${PASSWORD} \
	--pim=0 -k "" \
	--random-source=/dev/urandom \
	--size=${SIZE}
