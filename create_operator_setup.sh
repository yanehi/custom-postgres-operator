#!/bin/sh

set -x

kubectl create -f manifests/configmap.yaml --namespace zalando-postgres

kubectl create -f manifests/operator-service-account-rbac.yaml --namespace zalando-postgres

kubectl create -f manifests/postgres-operator.yaml --namespace zalando-postgres

sleep 5

kubectl get pod -l name=postgres-operator --namespace zalando-postgres

kubectl create -f manifests/minimal-postgres-manifest.yaml --namespace zalando-postgres