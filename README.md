# ACS Install

Notes for install are [here](https://access.redhat.com/documentation/en-us/red_hat_advanced_cluster_security_for_kubernetes/3.72/html/installing/install-ocp-operator#install-acs-operator_install-ocp-operator).

Installation methods are below.

## CLI
Just run my script.

```shell
./install.sh
```

## Web Console

1. Use Web Console and install operator, wait a long time

2. Then create `stackrox` namespace

3. Install Central there by using the web console and installed operators,
making sure to install central into `stackrox` namespace, wait a long time

4. Get password and URL (username is `admin`)

```shell
oc -n stackrox get secret central-htpasswd -o go-template='{{index .data "password" | base64decode}}'
oc -n stackrox get route central -o jsonpath="{.status.ingress[0].host}"
```

5. Log into stackrox and generate init bundle and download it `Download Kubernetes Secret File`

6. Apply that init bundle

```shell
oc create -f init_bundle.yaml -n stackrox
```

7. Create `SecuredCluster` in webconsole and accept all defaults

## Roxctl

1. Generate install script

```shell
roxctl central generate interactive
```

2. Run my install script

```shell
# warning untested
./roxctl-install.sh
```
