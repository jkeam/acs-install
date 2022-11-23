#!/bin/bash

oc create -f ./1_create_operator_namespace.yaml
oc create -f ./2_create_subscription.yaml
echo 'Installing operator, waiting a few seconds...'
sleep 5

oc create -f ./3_create_stackrox_namespace.yaml
oc create -f ./4_create_central.yaml
echo 'Installing central, waiting for 10 minutes...'
sleep 600
echo ''

echo 'Now download and install the init bundle...'
echo ''
echo 'URL: '
oc -n stackrox get route central -o jsonpath="{.status.ingress[0].host}"
echo ''
echo 'Password: '
oc -n stackrox get secret central-htpasswd -o go-template='{{index .data "password" | base64decode}}'
echo ''
read -n 1 -s -r -p "Press enter when done"

oc create -f ./5_create_secured_cluster.yaml
echo 'Installing secured cluster, waiting for 10 minutes...'
sleep 600
echo ''
echo 'Done'
