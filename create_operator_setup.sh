#!/bin/sh

set -x

kubectl create -f manifests/configmap.yaml -n zalando-postgres

kubectl create -f manifests/operator-service-account-rbac.yaml -n zalando-postgres

kubectl create -f manifests/postgres-operator.yaml -n zalando-postgres

sleep 10

kubectl get pod -l name=postgres-operator -n zalando-postgres

kubectl create -f manifests/postgres-instance.yaml -n zalando-postgres

sleep 10

kubectl get postgresql -n zalando-postgres

kubectl get pods -l application=spilo -L spilo-role -n zalando-postgres

kubectl get svc -l application=spilo -L spilo-role -n zalando-postgres
