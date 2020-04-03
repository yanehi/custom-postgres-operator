#!/bin/sh

set -x

kubectl delete clusterroles zalando-postgres-operator -n zalando-postgres

kubectl delete clusterrolebindings zalando-postgres-operator -n zalando-postgres

kubectl delete serviceaccounts zalando-postgres-operator -n zalando-postgres

kubectl delete secrets foo-user.postgres-instance.credentials postgres.postgres-instance.credentials standby.postgres-instance.credentials zalando.postgres-instance.credentials -n zalando-postgres

kubectl delete configmaps postgres-operator -n zalando-postgres

kubectl delete postgresql postgres-instance -n zalando-postgres

sleep 3

kubectl delete service postgres-instance postgres-instance-config postgres-instance-repl -n zalando-postgres

kubectl delete deployment postgres-operator -n zalando-postgres

kubectl delete statefulset postgres-instance -n zalando-postgres

kubectl delete pvc pgdata-postgres-instance-0 -n zalando-postgres

kubectl delete pvc pgdata-postgres-instance-1 -n zalando-postgres

kubectl delete pvc pgdata-postgres-instance-2 -n zalando-postgres