#!/bin/sh

set -x

kubectl delete clusterroles zalando-postgres-operator -n zalando-postgres

kubectl delete clusterrolebindings zalando-postgres-operator -n zalando-postgres

kubectl delete serviceaccounts  zalando-postgres-operator -n zalando-postgres

kubectl delete secrets foo-user.acid-minimal-cluster.credentials postgres.acid-minimal-cluster.credentials standby.acid-minimal-cluster.credentials zalando.acid-minimal-cluster.credentials -n zalando-postgres

kubectl delete configmaps postgres-operator -n zalando-postgres

kubectl delete postgresql acid-minimal-cluster --namespace zalando-postgres

kubectl delete service acid-minimal-cluster acid-minimal-cluster-repl -n zalando-postgres

kubectl delete poddisruptionbudgets postgres-acid-minimal-cluster-pdb -n zalando-postgres

kubectl delete pvc pgdata-acid-minimal-cluster-0 pgdata-acid-minimal-cluster-1 -n zalando-postgres