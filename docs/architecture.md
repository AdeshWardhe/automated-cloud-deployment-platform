# Platform Architecture

## Intended end-to-end architecture

```mermaid
flowchart TD
    A[Developer pushes code to GitHub] --> B[GitHub Actions workflow]
    B --> C[Install dependencies with uv]
    C --> D[Run pytest]
    D --> E[Semgrep static analysis]
    E --> F[Trivy filesystem scan]
    F --> G[Build Docker image]
    G --> H[Publish image to GHCR]
    H --> I[Kubernetes / K3s deployment]
    I --> J[FastAPI application]
    J --> K[Prometheus metrics]
    K --> L[Grafana dashboards]
```

## Verified local deployment path

```mermaid
flowchart TD
    A[FastAPI sample application] --> B[Dockerfile]
    B --> C[Docker image fastapi-sample:1.1]
    C --> D[Docker Compose]
    D --> E[Healthy FastAPI container]
    E --> F[Swagger UI /docs]
    F --> G[GET /players/ returns HTTP 200]
```

## Infrastructure as Code
Terraform currently configures the AWS provider for region `ap-southeast-2` and reads the active region as a data source. No AWS resources are declared or provisioned by the current configuration.

## Status note
The first diagram describes the target architecture, not a fully deployed system. The second diagram describes the local path that has been verified. GHCR, Kubernetes / K3s, Prometheus, and Grafana remain planned implementation work.
