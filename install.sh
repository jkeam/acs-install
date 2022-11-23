#!/bin/bash

oc create -f ./1_create_operator_namespace.yaml
oc create -f ./2_create_stackrox_namespace.yaml
oc create -f ./3_create_operator_group.yaml
oc create -f ./4_create_subscription.yaml
date
echo 'Installing operator, waiting 2 minutes...'
sleep 120
echo ''

oc create -f ./5_create_central.yaml
date
echo 'Installing central, waiting for 10 minutes...'
sleep 600
echo ''

echo 'Now generate the Cluster Init Bundle and download the Kubernetes secrets file'
echo 'Then run something like: oc create -f ./bundle-cluster-init-secrets.yaml -n stackrox'
echo ''
echo 'URL: '
oc -n stackrox get route central -o jsonpath="{.status.ingress[0].host}"
echo ''
echo 'Password: '
oc -n stackrox get secret central-htpasswd -o go-template='{{index .data "password" | base64decode}}'
echo ''
read -n 1 -s -r -p "Press enter when done"

oc create -f ./6_create_secured_cluster.yaml
echo 'Installing secured cluster, waiting for 10 minutes...'
sleep 600
echo ''
echo 'Done'
