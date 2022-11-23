#!/bin/bash

oc delete -f ./5_create_secured_cluster.yaml
echo 'Deleting secured cluster, waiting for 10 minutes...'
sleep 600
echo ''

oc delete -f ./4_create_central.yaml
echo 'Deleting central, waiting for 10 minutes...'
sleep 600
echo ''

oc delete -f ./3_create_stackrox_namespace.yaml
oc delete -f ./2_create_subscription.yaml
oc delete -f ./1_create_operator_namespace.yaml
sleep 5

echo 'Done'
