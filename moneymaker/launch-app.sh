#!/bin/bash

env=$1;

if [[ -z "$env" ]]
then
    echo "env argument not provided";
    exit 128
elif [[ "dev" = $env ]] || [[ "prod" = $env ]]
then
    namespace="mm-$env"
else
    echo "Invalid argument provided: $env"
    exit 128
fi

echo "Launching app in env $namespace"

kubectl apply -f namespaces.yml

kubectl apply -f config-map.yml

kubectl apply -f moneymaker-certs.yml

kubectl apply -f moneymaker-app.yml -n=$namespace

kubectl apply -f ingress-config.yml