# Automated Cloud-Native Deployment Platform

An automated DevOps and DevSecOps platform designed to test, scan, containerize, and deploy an existing FastAPI application using modern cloud-native technologies.

## Project Overview

The objective is to build an automated deployment pipeline that integrates continuous integration, security scanning, Docker containerization, Kubernetes orchestration, infrastructure as code, and application monitoring.

Rather than developing a new application, this project uses an existing public FastAPI application as the workload to demonstrate the deployment platform.

## Technology Stack

| Component | Technology |
|---|---|
| Source Control | Git, GitHub |
| CI/CD | GitHub Actions |
| Automated Testing | Pytest |
| Static Security Analysis | Semgrep |
| Vulnerability Scanning | Trivy (integration in progress) |
| Containerization | Docker |
| Container Configuration | Docker Compose |
| Container Registry | GitHub Container Registry (planned) |
| Infrastructure as Code | Terraform |
| Orchestration | Kubernetes / K3s (planned) |
| Monitoring | Prometheus and Grafana (planned) |

## Implementation Progress

### 1. Source Code and Continuous Integration

- Selected an existing public FastAPI REST API application.
- Pinned the source repository to a specific Git commit for reproducibility.
- Created a GitHub Actions workflow.
- Configured automated dependency installation using uv.
- Executed the application's automated test suite.

**Verified result:** 25 tests passed.

### 2. DevSecOps Integration

Integrated Semgrep into the GitHub Actions workflow to perform static application security analysis.

The scan completed and reported 31 findings, including potentially unsafe SQL patterns and GitHub Actions configuration recommendations.

These findings require triage and are not automatically confirmed exploitable vulnerabilities.

### 3. Docker Containerization

Created a Docker image using the application's existing multi-stage Dockerfile.

Implemented and verified:
- Multi-stage Docker builds.
- Python dependency packaging.
- Non-root container execution.
- Container health checks.
- Application startup using Gunicorn.
- Docker image creation.

**Verified result:** Docker image `fastapi-sample:1.1` built successfully.

### 4. Container Deployment

Used Docker Compose to configure and launch the FastAPI application.

Configured:
- Application port mapping: 9000.
- Persistent Docker storage volume.
- SQLite database environment variables.
- Container startup and health checks.

**Verified result:** Container `fastapi-app` reached the healthy state.

### 5. API Verification

Tested the deployed application through FastAPI Swagger UI.

Endpoint tested:

`GET /players/`

**Verified result:** HTTP 200 OK, with JSON player records returned successfully.

### 6. Debugging and Problem Resolution

During container deployment, the following issues were identified and resolved:

- Windows CRLF line endings prevented Linux shell scripts from executing correctly. Converted scripts to LF.
- The initial manual Docker run omitted the database environment variables and persistent storage volume.
- Switched to the application's Docker Compose configuration to supply the correct database settings and storage volume.

These debugging steps helped validate the container startup process and database configuration.

## Evidence

Screenshots and execution logs will be maintained in `docs/evidence/`.

| Evidence | Verification |
|---|---|
| GitHub Actions | CI execution |
| Pytest | 25 passing tests |
| Semgrep | 31 reported findings |
| Docker build | Successful image build |
| Docker Compose | Healthy container |
| Swagger UI | Successful HTTP 200 response |

## Planned Implementation

- Complete Trivy vulnerability scanning.
- Build and publish images to GHCR.
- Provision infrastructure using Terraform.
- Deploy the application using Kubernetes / K3s.
- Configure Prometheus and Grafana monitoring.
- Implement deployment health checks and rollback procedures.

## Project Status

The initial CI pipeline, Semgrep scanning, Docker image build, local container deployment, and API verification have been demonstrated successfully. The remaining cloud-native deployment and monitoring components are under development.
