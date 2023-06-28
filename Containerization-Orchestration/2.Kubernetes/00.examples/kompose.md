
### Convert Docker-compose to Kubernetes manifests
Using Kompose, in the docker-compose.yaml you first need to get rid of 'container_name', 'restart' fields, change '- ./path/to' to '- /path/to', change 'port' to 'expose' field.

```bash
kompose convert -f docker-compose.yaml -o ./kompose-k8s
kompose -f docker-compose convert
```

## Deploy to EKS cluster
```bash
```




[Link Text](/path/to/file.md#section-id)