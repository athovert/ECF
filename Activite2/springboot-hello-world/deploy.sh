#!/bin/bash

# ========= CONFIGURATION =========
APP_NAME="springboot-app"
DOCKER_USER="mondockerhub"              
DOCKER_IMAGE="$DOCKER_USER/$APP_NAME"
TAG=$(date +%Y%m%d%H%M)
KUBE_NAMESPACE="default"               
PORT_APP=8080
PORT_SERVICE=80
# =================================

echo "1 - Build & Test avec Maven"
mvn clean verify || { echo "Le build/test a échoué"; exit 1; }

echo "2 - Construction image Docker : $DOCKER_IMAGE:$TAG"
docker build -t $DOCKER_IMAGE:$TAG .

echo "3 - Connexion Docker & Push"
docker login || { echo "La connexion Docker Hub échouée"; exit 1; }
docker push $DOCKER_IMAGE:$TAG

echo "4 - Création manifest Kubernetes temporaire : k8s.yaml"
cat <<EOF > k8s.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $APP_NAME
  namespace: $KUBE_NAMESPACE
spec:
  replicas: 1
  selector:
    matchLabels:
      app: $APP_NAME
  template:
    metadata:
      labels:
        app: $APP_NAME
    spec:
      containers:
      - name: $APP_NAME
        image: $DOCKER_IMAGE:$TAG
        ports:
        - containerPort: $PORT_APP
---
apiVersion: v1
kind: Service
metadata:
  name: $APP_NAME-service
  namespace: $KUBE_NAMESPACE
spec:
  type: LoadBalancer
  selector:
    app: $APP_NAME
  ports:
    - protocol: TCP
      port: $PORT_SERVICE
      targetPort: $PORT_APP
EOF

echo "5 - Déploiement dans Kubernetes"
kubectl apply -f k8s.yaml

echo "Déploiement terminé"
kubectl get svc -n $KUBE_NAMESPACE
