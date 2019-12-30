#!/bin/bash

set -e

d=`dirname $0`

if [[ "x${H2O_NAME}" = "x" ]] ; then
  H2O_NAME=H2OServer
fi

if [[ "x${H2O_MAX_HEAP}" = "x" ]] ; then
  # Use 90% of RAM for H2O.
  memTotalKb=`cat /proc/meminfo | grep MemTotal | sed 's/MemTotal:[ \t]*//' | sed 's/ kB//'`
  memTotalMb=$[ $memTotalKb / 1024 ]
  tmp=$[ $memTotalMb * 90 ]
  xmxMb=$[ $tmp / 100 ]
  H2O_MAX_HEAP=${xmxMb}m
fi

# First try running java.

java -version

# Check that we can at least run H2O with the given java.
java -jar ${H2O_HOME}/h2o.jar -version

# Start H2O
java ${H2O_JVM_OPTIONS} -Xmx${H2O_MAX_HEAP} -jar ${H2O_HOME}/h2o.jar -name ${H2O_NAME} -flatfile flatfile.txt -port 54321 ${H2O_OPTIONS}
