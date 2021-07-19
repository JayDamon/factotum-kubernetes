#!/bin/bash

namespace=$1;

if [ -n "$namespace" ]
    then
        kubectl apply -f namespaces.yml

        kubectl apply -f config-map.yml

        kubectl apply -f moneymaker-certs.yml

        kubectl apply -f moneymaker-app.yml -n=$namespace

        kubectl apply -f ingress-config.yml
    else
        echo "Namespace argument not provided";
fi