# Tech Talk Graviton on EKS

## CPU Benchmark on Multi-Arch Kubernetes (EKS) Cluster

This demo showcases the performance difference between **x86_64** and **ARM64 (Graviton)** node groups on AWS EKS using a simple CPU benchmarking tool (`sysbench`).

---

## 📁 Project Structure

```
.
├── infra/       # Terraform code to create multi-arch EKS cluster
├── pods/        # Kubernetes YAML files for benchmarking pods
└── README.md    # You're here!
```

---

## What This Demo Shows

- How to create an Amazon EKS cluster with **both `amd64` and `arm64` node groups**
- Run a **CPU benchmark** (`sysbench`) in Docker containers on each architecture
- Compare performance results in real-time using `kubectl logs`

---

## 🚀 Getting Started

### Prerequisites

- Terraform CLI
- AWS CLI + credentials configured
- Docker
- `kubectl` configured
- DockerHub account (for image build and push)

---

## Step 1: Provision the EKS Cluster

```bash
cd infra
terraform init
terraform apply
```

This will create:
- An EKS cluster
- Two node groups:
  - `amd64` (e.g., t3.small)
  - `arm64` (e.g., t4g.small)

---

## Step 2: Build and Push Multi-Arch Docker Image

The image is already published here:
[`nomansadiq11/cpu-benchmark`](https://hub.docker.com/r/nomansadiq11/cpu-benchmark)

If you'd like to build your own:

```bash
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t nomansadiq11/cpu-benchmark:latest --push .
```

---

## Step 3: Deploy Benchmark Pods

```bash
cd pods

kubectl apply -f sysbench-amd64.yaml
kubectl apply -f sysbench-arm64.yaml
```

---

## Step 4: View Benchmark Results

```bash
kubectl logs sysbench-amd64
kubectl logs sysbench-arm64
```

### Example Output

| Architecture | Events/sec | Latency (avg ms) | Total Events |
|--------------|------------|------------------|--------------|
| `amd64`      | 1,642.18   | 1.22             | 16,425       |
| `arm64`      | 5,568.83   | 0.36             | 55,698       |

---

## Why This Matters

This demo highlights the **performance and efficiency** benefits of ARM-based AWS Graviton processors compared to traditional x86_64 CPUs for compute-bound workloads.

---

## References

- [AWS Graviton](https://aws.amazon.com/ec2/graviton/)
- [sysbench GitHub](https://github.com/akopytov/sysbench)
- [DockerHub: nomansadiq11/cpu-benchmark](https://hub.docker.com/r/nomansadiq11/cpu-benchmark)

---

## 🙋‍♂️ Author

**Noman Sadiq**
[GitHub](https://github.com/nomansadiq11) • [LinkedIn](https://www.linkedin.com/in/nomancs/)