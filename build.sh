#!/bin/sh

machine=$1
if [ "${machine}" = "all" ]; then
	for config in *.config; do
		machine=${config%.*}
		./build.sh ${machine}
	done
	exit 0
fi

config=${machine}.config
if [ ! -f "${config}" ]; then
	echo "${machine} config does not exist!"
	exit 1
fi

cp ${config} .config
make defconfig
make -j4

