#!/bin/bash

PROJECT=${1}

if [ "${PROJECT}" == "" ]; then
	echo "Usage: mount.sh <project>"
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

DATAVAULT_DIR=/home/rbrecheisen/datavault
DATAVAULT_MOUNT_DIR=/home/rbrecheisen/datavault-mounts

sudo veracrypt -t -k "" \
	--pim=0 \
	--protect-hidden=no \
	${DATAVAULT_DIR}/containers/${PROJECT}.hc ${DATAVAULT_MOUNT_DIR}/${PROJECT}

sudo chown -R rit-admin:users ${DATAVAULT_MOUNT_DIR}/${PROJECT}

echo "Do you wish to restart JupyterLab?"
read input
if [ "${input}" == "yes" ]; then
	cd ..
	./start.sh
fi
