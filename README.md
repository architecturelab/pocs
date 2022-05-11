# POCS
Prueba de concepto microservicio sobre Kubernetes en GCLOUD.

---

## 1. Create project on GCP
## 2. Create MySQL instance on Cloud SQL
-   VersionMySL: 5.7
-   IDInstace: products
-   PasswordInstaceRoot: CyA3OkcE3gehCBh0
-   Host: 35.194.231.235
-   DB: products
-   User: developer
-   Password: CyA3OkcE3gehCBh0
## 3. ON Kubernetes Engine API
-   Create cluster
## 4. ON Artifact registry (Container Registry)
### Publish image on docker registry
-   LocalConsole: "gcloud auth configure-docker"
-   LocalConsole: "docker build -t us.gcr.io/basearchitecture/microservice-lumen-docker_lumen ."
-   LocalConsole: "docker push us.gcr.io/basearchitecture/microservice-lumen-docker_lumen"
### Manual deploy and loadbalancer
-   ClientGCP: "kubectl create deployment lumen-deployment --image us.gcr.io/basearchitecture/img-lumen"
-   ClientGCP: "kubectl expose deployment lumen-deployment --type=LoadBalancer --port 80"
### Automatic scirpt deploy and loadbalancer
-   ClientGCP: "kubectl apply -f deploy-app.yml"
-   ClientGCP: "kubectl apply -f service-node.yml"

---
## References

### GCP GKE
-   https://github.com/adamofig/gcp-kubernetes-example
-   https://www.youtube.com/watch?v=aB_U-rultLY
### GCP Istio
-   https://www.youtube.com/watch?v=16fgzklcF7Y
### CI/CD GitHub GCP
-   https://cloud.google.com/community/tutorials/cicd-cloud-run-github-actions
### Kustomize
-   https://github.com/google-github-actions/setup-gcloud/tree/main/example-workflows/gke-kustomize
### GKE with DNS
-   https://cloud.google.com/kubernetes-engine/docs/how-to/cloud-dns


### Update cluster active DNS
-   "gcloud beta container clusters update cluster-main --cluster-dns clouddns --cluster-dns-scope cluster --zone us-central1-c"
