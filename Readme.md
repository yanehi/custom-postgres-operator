# Custom Postgres Operator

This repository contains a custom setup for an [HA](https://www.postgresql.org/docs/current/high-availability.html) [Postgres](https://www.postgresql.org/) cluster, based on [Postgres Operator](https://github.com/zalando/postgres-operator) from [Patroni](https://github.com/zalando/spilo). The manifest folder only contains the minimum needed YAML files for the setup.

The Cluster runs on an [K8s](https://kubernetes.io/) Cluster which is managed by [Rancher](https://rancher.com/) and hosted at the infrastructure of Proventa AG.


## Setup on K8s cluster(Rancher) 

* *Projectname:* zalando-postgres
* *Namespace:* zalando-postgres
* 3 Nodes
* *LoadBalancer:* [Metallb](https://metallb.universe.tf)
  * access actual Postgres master over external-IP and specified port
  * required VPN connection!!

## Installation

The installation will be executed by applying manifests in a specific order, based on the operator installation from Patroni. The setup is deployed to an specific namespace  named *zalando-postgres*, which must be ceated first on the K8s cluster. You also can setup the operator(+Postgres cluster) with Helm chart or Operator Lifecycle Manager.
(fyi: you can also set the current-context for kubectl, here ns=zalando-postgres for example)

### Create the operator

```shell
# operator configuration
$ kubectl create -f manifests/configmap.yaml --namespace zalando-postgres
# identity and permissions
$ kubectl create -f manifests/operator-service-account-rbac.yaml --namespace zalando-postgres
# deploy operator to K8s
$ kubectl create -f manifests/postgres-operator.yaml --namespace zalando-postgres
```

### Check operator status

* get all pods in the `namespace zalando-postgres` with the operator label `name=postgres-operator`

```shell
$ kubectl get pod -l name=postgres-operator --namespace zalando-postgres
```

### Create Postgres cluster

* create a Postgres cluster from [postgres manifest](manifest/minimal-postgres-manifest.yml) with the specified values, like databases, users and *postgresql.conf* parameters

```shell
$ kubectl create -f manifests/minimal-postgres-manifest.yaml --namespace zalando-postgres
```

### Check Postgres cluster status

```shell
# check the deployed cluster
$ kubectl get postgresql
# check created database pods with spilo-role (master, replica)
$ kubectl get pods -l application=spilo -L spilo-role --namespace zalando-postgres
# check created service resources and get ext. loadbalancer ip and port
$ kubectl get svc -l application=spilo -L spilo-role --namespace zalando-postgres
```

### Update Postgres cluster

You can update the Postgres cluster with the *manifest file* or directly with *psql-client*.

* After editting Postgres cluster file apply the modified configuration
  * `kubectl apply -f manifests/minimal-postgres-manifest.yaml --namespace zalando-postgres`
* Restart(Reload?) Patroni
  * `kubectl exec -i <Pod-Name> supervisorctl restart patroni --namespace zalando-postgres`

### Connect to Postgres master

* required `pg_hba.conf` entry for the external LoadBalancer IP

```shell
$ psql -h <LoadBalancer-IP> -p <LoadBalancer-Port>  -d <databasename> -U <databaseuser>
```

* connect directly from shell in Rancher

```shell
$ psql -d <databasename> -U <databaseuser>
```

## Referenced

* [Patroni Postgres Operator](https://github.com/zalando/postgres-operator)
  * [Documentation](https://postgres-operator.readthedocs.io/en/latest/)