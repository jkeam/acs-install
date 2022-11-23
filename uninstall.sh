#!/bin/bash

oc delete -f ./6_create_secured_cluster.yaml
date
echo 'Deleting secured cluster, waiting for 10 minutes...'
sleep 600
echo ''

oc delete -f ./5_create_central.yaml
date
echo 'Deleting central, waiting for 10 minutes...'
sleep 600
echo ''

oc delete -f ./4_create_subscription.yaml
oc delete -f ./3_create_operator_group.yaml
oc delete -f ./2_create_stackrox_namespace.yaml
oc delete -f ./1_create_operator_namespace.yaml

echo 'Done'
