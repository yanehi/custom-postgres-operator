#!/bin/sh

set -x

kubectl create -f manifests/configmap.yaml --namespace zalando-postgres

kubectl create -f manifests/operator-service-account-rbac.yaml --namespace zalando-postgres

kubectl create -f manifests/postgres-operator.yaml --namespace zalando-postgres

sleep 10

kubectl get pod -l name=postgres-operator --namespace zalando-postgres

kubectl create -f manifests/minimal-postgres-manifest.yaml --namespace zalando-postgres

sleep 10

kubectl get postgresql --namespace zalando-postgres

kubectl get pods -l application=spilo -L spilo-role --namespace zalando-postgres

kubectl get svc -l application=spilo -L spilo-role --namespace zalando-postgres
