### Build images for another platform architecture (For testing/development)

```bash
# Build for ARM64 (default)
docker build -t <image-name>:<version>-arm64 .

# Build for ARM64 
docker build --platform=linux/arm64 -t <image-name>:<version>-arm64 .

# Build for AMD64
docker build --platform=linux/amd64 -t <image-name>:<version>-amd64 .
```

### Refresh Auth Token
```
aws ecr get-login-password | docker login --username AWS --password-stdin 616266867516.dkr.ecr.us-east-1.amazonaws.com
```
# Create ECR Repo
```
aws ecr create-repository --repository-name dashboard --region us-east-1
```
# Docker

## Docker-compose Up
cd Downloads\BNGO\bngo-provisioning\
```
docker-compose up -d filehandler
docker-compose up -d gateway
```

## Microservices Path Directories
```
cd Downloads\BNGO\bngo-provisioning\repos\bngo-gateway\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-file-handler\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-users\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-tiles\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-subsidiaries\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-subcategories\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-prizes\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-roles-group\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-regulation\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-notifications\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-jackpot\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-holidays\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-game-information\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-discounts\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-elasticsearch\kubernetes\docker 

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-cron\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-cms\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-crm\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-audit\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-board\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-avatar-images-packs\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-categories\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-sponsors\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-sponsorship-program\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-service-areas\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-microservice-bunchball\kubernetes\docker

cd Downloads\BNGO\bngo-provisioning\repos\bngo-landing-page\kubernetes\docker
cd Downloads\BNGO\bngo-provisioning\repos\bngo-dashboard-admin\kubernetes\docker
```

## BUILD Microservices: 
```
docker build  --no-cache -t <service>:latest -f .\Dockerfile ..\..\

docker-compose build gateway
docker build  --no-cache -t gateway:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t filehandler:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t users:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t tiles:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t subsidiaries:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t subcategories:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t prizes:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t group:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t regulations:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t jackpot:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t notifications:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t holidays:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t game:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t discounts:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t search:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t cron:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t cms:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t crm:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t audit:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t board:latest -f .\Dockerfile ..\..\
docker build  --no-cache -t avatar-images-pack:latest -f .\Dockerfile ..\..\

docker build  --no-cache -t categories -f .\Dockerfile ..\..\

docker build  --no-cache -t sponsors -f .\Dockerfile ..\..\
docker build  --no-cache -t sponsorship -f .\Dockerfile ..\..\

docker build  --no-cache -t areas -f .\Dockerfile ..\..\
docker build  --no-cache -t bunchball -f .\Dockerfile ..\..\

docker build  --no-cache -t landing:latest -f .\Dockerfile ..\..\
docker-compose
docker build  --no-cache -t dashboard:latest -f .\Dockerfile ..\..\
```

## TAG Microservices:
```
docker tag <service>:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/<service>:latest

docker tag bngo-provisioning-gateway:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/gateway:latest
docker tag gateway:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/gateway:latest
docker tag bngo-provisioning-filehandler:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/filehandler:latest
docker tag filehandler:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/filehandler:latest
docker tag users:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/users:latest
docker tag bngo-provisioning-users:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/users:latest

docker tag tiles:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/tiles:latest
docker tag subsidiaries:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/subsidiaries:latest
docker tag bngo-provisioning-subsidiaries:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/subsidiaries:latest

docker tag subcategories:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/subcategories:latest

docker tag prizes:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/prizes:latest
docker tag group:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/group:latest
docker tag regulations:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/regulations:latest

docker tag jackpot:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/jackpot:latest
docker tag notifications:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/notifications:latest
docker tag holiday:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/holiday:latest

docker tag game:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/game:latest
docker tag discounts:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/discounts:latest
docker tag search:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/search:latest

docker tag cron:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/cron:latest
docker tag cms:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/cms:latest
docker tag bngo-provisioning-cms:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/cms:latest

docker tag crm:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/crm:latest

docker tag audit:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/audit:latest
docker tag board:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/board:latest
docker tag avatar-images-pack:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/avatar-images-pack:latest

docker tag categories:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/categories:latest
docker tag sponsors:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/sponsors:latest
docker tag sponsorship:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/sponsorship:latest

docker tag areas:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/areas:latest
docker tag bunchball:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/bunchball:latest

docker tag bngo-provisioning-landing:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/landing:latest
docker tag bngo-provisioning-dashboard:latest 616266867516.dkr.ecr.us-east-1.amazonaws.com/dashboard:latest

```

## PUSH Microservices To ECR:
```
docker push <your-repo-uri>/my-image:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/gateway:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/filehandler:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/users:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/tiles:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/subsidiaries:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/subcategories:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/prizes:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/group:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/regulations:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/jackpot:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/notifications:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/holiday:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/game:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/discounts:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/search:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/cron:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/cms:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/crm:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/audit:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/board:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/avatar-images-pack:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/categories:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/sponsors:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/sponsorship:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/areas:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/bunchball:latest

docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/landing:latest
docker push 616266867516.dkr.ecr.us-east-1.amazonaws.com/dashboard:latest
```

# Kubernetes Manifests 
```
cd Downloads\BNGO\bngo-provisioning\kubernetes-services\microservices\
```

## Apply Manifests on EKS
```
kubectl apply -f ..\1-ConfigMaps.yaml
kubectl apply -f ..\2-Secrets.yaml
kubectl apply -f ..\3-Service-ServiceAccount.yaml
kubectl apply -f ..\4-ClusterRole-ClusterRoleBinding.yaml
kubectl apply -f ..\5-Role-RoleBinding.yaml
kubectl apply -f ..\6-StorageClasses.yaml
kubectl apply -f ..\7-Ingress.yaml
kubectl apply -f ..\8-

kubectl apply -f .\gateway.yaml
kubectl apply -f .\filehandler.yaml
kubectl apply -f .\users.yaml

kubectl apply -f .\tiles.yaml
kubectl apply -f .\subsidiaries.yaml
kubectl apply -f .\subcategories.yaml

kubectl apply -f .\prizes.yaml
kubectl apply -f .\group.yaml
kubectl apply -f .\regulations.yaml

kubectl apply -f .\jackpot.yaml
kubectl apply -f .\notifications.yaml
kubectl apply -f .\holidays.yaml

kubectl apply -f .\game-info.yaml
kubectl apply -f .\discounts.yaml
kubectl apply -f .\search.yaml

kubectl apply -f .\cron.yaml
kubectl apply -f .\crm.yaml
kubectl apply -f .\cms.yaml

kubectl apply -f .\audit.yaml
kubectl apply -f .\board.yaml
kubectl apply -f .\avatar-images-pack.yaml

kubectl apply -f .\categories.yaml
kubectl apply -f .\sponsors.yaml
kubectl apply -f .\sponsorship.yaml

kubectl apply -f .\areas.yaml
kubectl apply -f .\bunchball.yaml

kubectl apply -f .\landing-page.yaml
kubectl apply -f .\dashboard-admin.yaml
```

## Delete Manifests on EKS
```
kubectl delete -f ..\1-ConfigMaps.yaml
kubectl delete -f ..\2-Secrets.yaml
kubectl delete -f ..\3-serviceaccount.yaml
kubectl delete -f ..\4-clusterrole-clusterrolebinding.yaml
kubectl delete -f ..\5-role-rolebinding.yaml
kubectl delete -f ..\6-storageclass.yaml

kubectl delete -f .\gateway.yaml
kubectl delete -f .\filehandler.yaml
kubectl delete -f .\users.yaml

kubectl delete -f .\tiles.yaml
kubectl delete -f .\subsidiaries.yaml
kubectl delete -f .\subcategories.yaml

kubectl delete -f .\landing.yaml
kubectl delete -f .\dashboard.yaml
```
--------------------------------------------------

# EFS
## AUTHORIZE SECURITY GROUP
*   aws ec2 authorize-security-group-ingress --group-id sg-0e256f699f6637802 --protocol tcp --port 80 --cidr 172.31.0.0/16

## MOUNT
*   mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0ac47653c7c9d065d.efs.us-east-1.amazonaws.com:/ mnt

## MOUNT TARGET FFROM AWSCTL
*   aws efs create-mount-target --file-system-id fs-0ac47653c7c9d065d --subnet-id subnet-02c79e7b81a7284cb --security-groups sg-0e256f699f6637802 --region us-east-1 
---
--------------------------------------------------

# DOC
### If File Systems aren't created in Gateway & Filehandler kubernetes pods, create Filesystem directory and grant permissions.
```sh
# Enter Gateway & File Handler Pods
kubectl exec -i -t -n qa <pod-name> -c <service>-container -- sh -c "clear; (bash || ash || sh)"

# Create Shared folder
mkdir -p /mnt/disk1/file-handler/uploads

# Grant permissions
chmod -R a+w file-handler/
```

# TLS/SSL CERT 
aws acm import-certificate --certificate .\generated-csr.pem --certificate-chain .pem --private-key generated-private-key.pem

## manifest
proxy-real-ip-cidr: 172.31.0.0/16

service.beta.kubernetes.io/aws-load-balancer-ssl-cert: arn:aws:acm:us-east-1:616266867516:certificate/12a8c8b0-8b1e-4a92-b44e-30a2015f488f


aws acm export-certificate --certificate-arn arn:aws:acm:us-east-1:616266867516:certificate/12a8c8b0-8b1e-4a92-b44e-30a2015f488f --output-format pem --export-format pem_with_private_key --region us-east-1 --output private_cert_with_key.pem
----------------------------------------------
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace

---------
# DEMO
*   kubectl exec -i -t -n qa gateway-6f99b4b47d-mgfws -c gateway-container -- sh -c "clear; (bash || ash || sh)"
-------------------------------------------------------


-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

####

MongoDB&reg; can be accessed on the following DNS name(s) and ports from within your cluster: mongodb-0.mongodb-headless.qa.svc.cluster.local:27017

mongodb-1.mongodb-headless.qa.svc.cluster.local:27017

mongodb-2.mongodb-headless.qa.x.cluster.local:27017 

To connect to your database, create a MongoDB&reg; client container:
 
```sh
kubectl run --namespace qa mongodb-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:6.0.3-debian-11-r9 --command -- bash
```
 

Then, run the following command: 
```sh
mongosh admin --host "mongodb-0.mongodb-headless.qa.svc.cluster.local:27017,mongodb-1.mongodb-headless.qa.svc.cluster.local:27017,mongodb-2.mongodb-headless.qa.svc.cluster.local:27017" --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
```

Rabbitmq

Credentials:

```sh
echo "Username : user"

echo "Password : $(kubectl get secret --namespace qa rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 -d)"

echo "ErLang Cookie : $(kubectl get secret --namespace qa rabbitmq -o jsonpath="{.data.rabbitmq-erlang-cookie}" | base64 -d)"
```

RabbitMQ can be accessed within the cluster on port 5672 at rabbitmq.qa.svc.cluster.local


helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace qa



# PORTS

## Docker-compose 

### HOST_PORT:CONTAINER_PORT
"8071:80" 
docker build
## Kubernetes

#### hostPort: field allows a container to use a specific port on the host machine. This essentially means that Kubernetes will forward traffic to the specified port on the host machine to the container within the Pod.
#### containerPort: is the port that the container listens on for traffic. It is specified in the Pod definition.
#### ports: specifies the port on which the service is exposed to the cluster.
#### targetPort: These are the ports on the pods that the service is forwarding traffic to. 

nodePort: These are the ports on the host machine that are mapped to the service ports of the pods. They are used to access the service from outside the cluster.

Service ports: These are the ports that your service listens on, and they are specified in the service configuration file. Service ports can be the same as container ports, or they can be mapped to different container ports.

