# Manifest Files

## `complete-postgres-manifest.yaml`

* near all Postgres cluster configuration options for deploying Postgres cluster
  *  Dockerimage: [Spilo](https://github.com/zalando/spilo)
  * replicas
  * users
  * Container resources
  * postgresql.conf parameters
  * pg_hba.conf
  * logical backups to s3 (required Docker Image)


## `minimal-postgres-manifest.yaml`

* configured file for specific setup of Postgres cluster
* same as above with minimal options set


## `configmap.yaml`

* configuration options for the Postgres operator


## `operator-service-account-rbac.yaml`

* definied ClusterRole, ClusterRoleBinding and ServiceAccount for Postgres operator


## `postgres-operator.yaml`

* definition of Postgres operator with template and reference to created ConfigMap


## `postgresql-operator-default-configuration.yaml`

* near all configuration options for the Postgres operator


## `standby-manifest.yaml`

* create a standby cluster from an s3 backup


## `user-facing-clusterroles.yaml`

* defining ClusterRoles for Postgrs operator