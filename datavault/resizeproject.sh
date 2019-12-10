#!/bin/bash

PROJECT=${1}
if [ "${PROJECT}" == "" ]; then
	echo "Usage: resizeproject.sh <project name> <new size> <new password>"
	exit 1
fi

SIZE=${2}
if [ "${SIZE}" == "" ]; then
	echo "Usage: resizeproject.sh <project name> <new size> <new password>"
	exit 1
fi

PASSWORD=${3}
if [ "${PASSWORD}" == "" ]; then
	echo "Usage: resizeproject.sh <project name> <new size> <new password>"
	exit 1
fi

echo "Have you stopped JupyterLab?"
read input
if [ "${input}" != "yes" ]; then
        echo "Do you wish to stop JupyterLab?"
        read moreinput
        if [ "${moreinput}" == "yes" ]; then
                cd ..
                ./stop.sh
                cd datavault
        else
                exit 1
        fi
fi

sudo veracrypt -d

DATAVAULT_DIR=/home/rbrecheisen/datavault
DATAVAULT_MOUNT_DIR=/home/rbrecheisen/datavault-mounts

VOLUME_PATH=${DATAVAULT_DIR}/containers/${PROJECT}_new.hc

VOLUME_MOUNT_PATH=${DATAVAULT_MOUNT_DIR}/${PROJECT}_new

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

sudo veracrypt -t -k "" \
        --pim=0 \
        --protect-hidden=no \
        ${DATAVAULT_DIR}/containers/${PROJECT}.hc ${DATAVAULT_MOUNT_DIR}/${PROJECT}
sudo veracrypt -t -k "" \
        --pim=0 \
        --protect-hidden=no \
        ${DATAVAULT_DIR}/containers/${PROJECT}_new.hc ${DATAVAULT_MOUNT_DIR}/${PROJECT}_new

sudo chown -R rit-admin:users ${DATAVAULT_MOUNT_DIR}/${PROJECT}
sudo chown -R rit-admin:users ${DATAVAULT_MOUNT_DIR}/${PROJECT}_new

sudo cp -R ${DATAVAULT_MOUNT_DIR}/${PROJECT}/* ${DATAVAULT_MOUNT_DIR}/${PROJECT}_new

sudo veracrypt -d

mv ${DATAVAULT_DIR}/containers/${PROJECT}_new.hc ${DATAVAULT_DIR}/containers/${PROJECT}.hc

echo "Done"
