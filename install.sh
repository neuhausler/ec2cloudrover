#!/bin/bash

#
# This script installs and configures cloudrover on a fresh Amazon Linux AMI instance.
# Requires Erlang to be installed
#
# Must be run with root privileges
#

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin


git clone git://github.com/neuhausler/cloudrover
cd cloudrover
make
cd ..
cp -r cloudrover /usr/local/lib/

ln -s /usr/local/lib/cloudrover/priv /usr/local/etc/cloudrover
mkdir -p /usr/local/var/log/cloudrover
mkdir -p /usr/local/var/run/cloudrover

# copy changed config file
cp cloudrover.conf /usr/local/lib/cloudrover/priv/

# download init.d script
cp cloudrover-initd /usr/local/etc/rc.d/cloudrover
chmod 0755 /usr/local/etc/rc.d/cloudrover
ln -s /usr/local/etc/rc.d/cloudrover /etc/init.d/cloudrover


# done!
echo
echo
echo "Installation complete!"
echo "CloudRover is ready to start. Run:"
echo "    sudo service cloudrover start"

