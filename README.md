# EMCO

## EMCO

The Edge Multi-Cluster Orchestrator (EMCO) is a software framework for
intent-based deployment of cloud-native applications to a set of Kubernetes
clusters, spanning enterprise data centers, multiple cloud service providers
and numerous edge locations. It is architected to be flexible, modular and
highly scalable. It is aimed at various verticals, including telecommunication
service providers.
Refer to [EMCO documentation](https://gitlab.com/project-emco/core/emco-base/-/blob/main/docs/design/emco-design.md) for details on EMCO architecture.

## Using Helm
Using the official EMCO Helm charts for EMCO is the recommended installation/deployment method for first-timers.
This isn't the only way of deploying EMCO using Helm, but it's the only one using pre-built Helm charts. As such, there is no cloning of source code involved.


Before attempting to install, make sure you already have Kubernetes cluster available and that the  ```$KUBECONFIG``` environment variable is set to its kubeconfig file path.


## Script to make your machine ready to deploy EMCO

### STEPS:

1.) Clone this github repository:
 
```
git clone https://github.com/wafi981/EMCO-.git
```

2.) Move inside the folder and give permissions to the script

```
cd EMCO-
chmod 777 Deploy.sh

```
3.) Run the script to get your kubeadm cluster

```
./Deploy.sh

```


## NOTE: You can go inside the deployment script and set the version through the ```--set global.emcoTag``` while passing the helm install command
