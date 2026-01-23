#!/bin/bash

echo "starting kubernetes lifecycle automation"

# -------- Variables --------
NAMESPACE=beginnerr
POD_NAME=myapp-pod
IMAGE=nginx:latest
CONTAINER_PORT=80
SERVICE_NAME=myapp-service
SERVICE_TYPE=NodePort

# -------- Create Namespace --------
echo "creating namespace"
kubectl create namespace "$NAMESPACE" \
  --dry-run=client -o yaml | kubectl apply -f -

# -------- Create Pod --------
echo "creating pod"
kubectl run "$POD_NAME" \
  --image="$IMAGE" \
  --port="$CONTAINER_PORT" \
  --restart=Never \
  -n "$NAMESPACE"

# -------- Expose Pod --------
echo "exposing pod"
kubectl expose pod "$POD_NAME" \
  --name="$SERVICE_NAME" \
  --port="$CONTAINER_PORT" \
  --target-port="$CONTAINER_PORT" \
  --type="$SERVICE_TYPE" \
  -n "$NAMESPACE"

echo "done!"
kubectl get pods,svc -n "$NAMESPACE"

