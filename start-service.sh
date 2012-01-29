#!/bin/sh
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin
cd `dirname $0`
run_erl -daemon /usr/local/var/run/cloudrover/ /usr/local/var/log/cloudrover/ "exec erl -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -s reloader -s cloudrover"
