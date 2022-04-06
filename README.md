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
-   LocalConsole: "gcloud auth configure-docker"
-   LocalConsole: "docker build -t us.gcr.io/basearchitecture/microservice-lumen-docker_lumen ."
-   LocalConsole: "docker push us.gcr.io/basearchitecture/microservice-lumen-docker_lumen"
-   ClientGCP: "kubectl create deployment lumen-deployment --image us.gcr.io/basearchitecture/img-lumen"
-   ClientGCP: "kubectl expose deployment lumen-deployment --type=LoadBalancer --port 80"

---
## References
-   https://github.com/adamofig/gcp-kubernetes-example
-   https://www.youtube.com/watch?v=16fgzklcF7Y
-   https://www.youtube.com/watch?v=aB_U-rultLY
