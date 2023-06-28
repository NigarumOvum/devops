#!/usr/bin/env bash

##
# Script to create a new nginx ingress controller in kubernetes
##

## Configure script to exit on error ##
set -e

INGRESS_NAME=ingress

{ # try

    helm ls --all ${INGRESS_NAME} && helm del --purge ${INGRESS_NAME}

} || { # catch
    # save log for exception
    echo "Installing clean service"
}

helm install stable/nginx-ingress --name ${INGRESS_NAME} --namespace websites --set rbac.create=true --set rbac.createRole=true --set rbac.createClusterRole=true