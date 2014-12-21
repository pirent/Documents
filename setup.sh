#!/bin/bash
## ===============================================================================
## Title: setup.sh
## Description: This script is use for setting up the basic conditions for running
## the H.A recovery processes.
## Author: pirent420
## Date: 2014-Dec-21
## Usage: bash setup.sh --mca "MC-A IP address" --mcb "MC-B IP address"
## ===============================================================================
##

## ===============================================================================
## Constants
## ===============================================================================
MCA_IP=
MCB_IP=
EXECUTE_COMMAND=/bin/bash
#SNMPD_CONF=/etc/snmp/snmpd.conf
#SCRIPTS_DIR=
#SET_COROSYNC_COMMAND_NAME=
#SET_COROSYNC_SCRIPT=
#SET_DB_REPLICATE_COMMAND_NAME=
#SET_DB_REPLICATE_SCRIPT=
#GET_COROSYNC_STATUS_COMMAND_NAME=
#GET_COROSYNC_STATUS_SCRIPT=
#GET_DB_REPLICATE_STATUS_COMMAND_NAME=
#GET_DB_REPLICATE_STATUS_SCRIPT=

# This is for my testing on local machine
# So, comments out them when you use
SNMPD_CONF=/tmp/snmpd.conf
SCRIPTS_DIR=/tmp/scripts_dir/

SET_COROSYNC_COMMAND_NAME=set_corosync
SET_COROSYNC_SCRIPT=set_corosync.sh

SET_DB_REPLICATE_COMMAND_NAME=set_database_replicate
SET_DB_REPLICATE_SCRIPT=set_database_replicate.sh

GET_COROSYNC_STATUS_COMMAND_NAME=get_corosync
GET_COROSYNC_STATUS_SCRIPT=get_corosync.sh

GET_DB_REPLICATE_STATUS_COMMAND_NAME=get_database_replicate
GET_DB_REPLICATE_STATUS_SCRIPT=get_database_replicate.sh

## ===============================================================================
## Helper methods
## ===============================================================================
usage()
{
	echo "Usage: setup.sh --mca \"MC-A IP address\" --mcb \"MC-B IP address\""
}

## ===============================================================================
## Main
## ===============================================================================
clear
echo Running setup...

## ---------------------------------------------------------------
## Checking the arguments
## ---------------------------------------------------------------
if [ $# -ne 4 ]; then
	echo "Must entered the IP addresses of both MCs"
	usage
	exit 1
fi

while [ $# -ne 0 ]; do
	case $1 in
		--mca 	)	shift
					MCA_IP=$1
					shift
					;;
		--mcb 	)	shift
					MCB_IP=$1
					shift
					;;

		*		)	usage
		;;
	esac
done

echo "MC-A IP address is $MCA_IP"
echo "MC-B IP address is $MCB_IP"

## ---------------------------------------------------------------
## Copy 4 scripts to the appropriate places.
## ---------------------------------------------------------------
printf "\n%s\n\n" "Copying external scripts to $SCRIPTS_DIR: "
rsync -av --progress --exclude="setup.sh" $PWD/ $SCRIPTS_DIR 
printf "\n"

## ---------------------------------------------------------------
## Add 'extend' and 'extendfix' directives to the snmpd.conf
## ---------------------------------------------------------------
grep --quiet "$SET_COROSYNC_COMMAND_NAME" $SNMPD_CONF
if [ $? -eq 1 ]; then
	echo extendfix $SET_COROSYNC_COMMAND_NAME $EXECUTE_COMMAND $SET_COROSYNC_SCRIPT >> $SNMPD_CONF
fi

grep --quiet "$SET_DB_REPLICATE_COMMAND_NAME" $SNMPD_CONF
if [ $? -eq 1 ]; then
	echo extendfix $SET_DB_REPLICATE_COMMAND_NAME $EXECUTE_COMMAND $SET_DB_REPLICATE_SCRIPT >> $SNMPD_CONF
fi

grep --quiet "$GET_COROSYNC_STATUS_COMMAND_NAME" $SNMPD_CONF
if [ $? -eq 1 ]; then
	echo extend $GET_COROSYNC_STATUS_COMMAND_NAME $EXECUTE_COMMAND $GET_COROSYNC_STATUS_SCRIPT >> $SNMPD_CONF
fi

grep --quiet "$GET_DB_REPLICATE_STATUS_COMMAND_NAME" $SNMPD_CONF
if [ $? -eq 1 ]; then
	echo extend $GET_DB_REPLICATE_STATUS_COMMAND_NAME $EXECUTE_COMMAND $GET_DB_REPLICATE_STATUS_SCRIPT >> $SNMPD_CONF
fi

exit 0