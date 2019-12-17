#!/bin/sh

set -x

kubectl delete clusterroles zalando-postgres-operator -n zalando-postgres

kubectl delete clusterrolebindings zalando-postgres-operator -n zalando-postgres

kubectl delete serviceaccounts  zalando-postgres-operator -n zalando-postgres

kubectl delete secrets foo-user.postgres-instance.credentials postgres.postgres-instance.credentials standby.postgres-instance.credentials zalando.postgres-instance.credentials -n zalando-postgres

kubectl delete configmaps postgres-operator -n zalando-postgres

kubectl delete postgresql postgres-instance -n zalando-postgres

kubectl delete service postgres-instance postgres-instance-repl -n zalando-postgres

kubectl delete poddisruptionbudgets postgres-acid-minimal-cluster-pdb -n zalando-postgres

# kubectl delete pvc pgdata-acid-minimal-cluster-0 pgdata-acid-minimal-cluster-1 pgdata-acid-minimal-cluster-2 -n zalando-postgres