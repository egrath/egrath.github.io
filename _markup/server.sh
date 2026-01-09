#!/usr/bin/env bash
#
# this just runs a small http server for testing the webpage locally
#
MYDIR=$(dirname $(readlink -f $0))

if [ ! -x "$(which sfk)" ]; then
	echo sfk not installed
	exit
fi

pushd ${MYDIR}/.. 2>/dev/null 1>&2
sfk httpserv -nolist -deep -port 8088
popd 2>/dev/null 1>&2
