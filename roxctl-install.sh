#!/bin/bash

./central-bundle/central/scripts/setup.sh
oc create -R -f central-bundle/central
echo 'Installing central, waiting 10 min...'
sleep 600

echo ''
echo 'Route:'
oc -n stackrox get route central
echo ''
echo 'Password:'
cat central-bundle/password

./central-bundle/scanner/scripts/setup.sh
oc create -R -f central-bundle/scanner
echo ''
echo 'Installing scanner, waiting 10 min...'
sleep 600

echo ''
echo 'Go to ACS, Platform Configuration -> Clusters'
echo 'Then +New Cluster and "Download YAML File and Keys"'
echo 'Then run: unzip -d sensor sensor-<cluster_name>.zip'
echo 'And finally: ./sensor/sensor.sh'
echo 'To verify watch pods: oc get pod -n stackrox -w'
