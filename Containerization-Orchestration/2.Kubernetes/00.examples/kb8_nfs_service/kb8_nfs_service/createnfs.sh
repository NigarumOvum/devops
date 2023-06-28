#!/usr/bin/env bash

##
# Script to create a Network File System Server Disk
##

## Configure script to exit on error ##
set -e

DISK="disk1"

## Read bash options
for i in "$@"
   do
    case $i in
        -d=*|--disk=*)
        DISK="${i#*=}"
        shift # past argument=value
        ;;
        *)
              # unknown option
        ;;
    esac
done

if [ -d "./${DISK}" ]; then
    kubectl apply -f ${DISK}/nfs-server.yaml
    kubectl apply -f ${DISK}/service.yaml
    kubectl apply -f ${DISK}/pv-and-pvc-nfs.yaml
else
    echo ""
    echo "[ERROR]-> Disk folder not exist"
    echo ""
fi