#!/bin/bash

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

echo "Do you wish to restart JupyterLab?"
read input
if [ "${input}" == "yes" ]; then
	cd ..
	./start.sh
fi
