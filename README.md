### 1. Install Dependencies
sudo apt-get update -y
sudo apt-get install -y docker.io
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl && sudo mv kubectl /usr/local/bin/
# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind && sudo mv ./kind /usr/local/bin/


### 2. Create Cluster

kind create cluster --name ha-cluster --config kind-config.yaml
kubectl get nodes

---

## Ingress Setup
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0/deploy/static/provider/kind/deploy.yaml
kubectl get pods -n ingress-nginx
```

---

##  Deploy Sample App
```bash
kubectl apply -f k8s/app-deployment.yaml
kubectl apply -f k8s/ingress.yaml
```

Test:
```bash
curl http://sample.local
```

---

## Zero-Downtime Updates
```bash
kubectl set image deployment/sample-app nginx=nginx:1.27
kubectl rollout status deployment/sample-app
```

---

## Stateful DB
```bash
kubectl apply -f k8s/db-redis.yaml
kubectl get pods
```

---

##  Bonus – Terraform Automation
cd terraform
terraform init
terraform apply -auto-approve


<img width="621" height="359" alt="Screenshot 2025-09-25 at 12 23 49 AM" src="https://github.com/user-attachments/assets/756e9cb0-5003-4969-aaab-697d2a9f6dd0" />

<img width="830" height="414" alt="Screenshot 2025-09-25 at 12 20 38 AM" src="https://github.com/user-attachments/assets/19855651-9f29-4c07-adaa-38a73a9bafe5" />
