# Implementation Report

## Project
Automated Cloud-Native Deployment Platform with CI/CD, Kubernetes, Monitoring, and DevSecOps.

## Objective
Build an automated platform that takes an existing FastAPI application through testing, security analysis, containerization, and eventually cloud-native deployment and monitoring.

## Work completed and verified

### 1. Source control and CI
- Platform source is maintained in GitHub.
- The sample FastAPI application is checked out at a pinned commit for reproducibility.
- GitHub Actions installs dependencies using uv and runs the application's tests.
- Latest verified test result recorded during implementation: **25 tests passed**.

### 2. Static security analysis
- Semgrep is integrated into the GitHub Actions workflow.
- A scan completed and reported **31 findings**.
- Findings are static-analysis alerts and recommendations; they have not all been confirmed as exploitable vulnerabilities.
- The sample application's source was used as the scan target.

### 3. Trivy
- A Trivy filesystem scan step is configured in the workflow for vulnerability, secret, and misconfiguration checks.
- The step is configured with a non-blocking exit code.
- A successful completed Trivy scan result has not yet been verified; do not present this as a completed scan.

### 4. Docker image
- Built the sample FastAPI application using its multi-stage Dockerfile.
- The successful image tag was `fastapi-sample:1.1`.
- The build completed successfully.
- Linux shell scripts were converted from Windows CRLF to LF after the first container startup failed.

### 5. Local container deployment
- Used the sample application's Docker Compose configuration.
- Configured port mapping on port 9000, SQLite database environment variables, and a persistent named volume.
- The `fastapi-app` container reached the healthy state.

### 6. API verification
- Opened the FastAPI Swagger UI at `http://localhost:9000/docs`.
- Tested `GET /players/`.
- Received **HTTP 200 OK** with JSON player records.

### 7. Terraform and AWS
- Configured the Terraform AWS provider for `ap-southeast-2`.
- Terraform formatting, validation, and planning were completed.
- The configuration currently reads the AWS region and outputs it.
- No AWS infrastructure or application workload has been provisioned. No cloud deployment is claimed.

## Current implementation status

| Area | Status |
|---|---|
| GitHub repository | In use |
| GitHub Actions test workflow | Verified |
| Pytest | 25 tests passed |
| Semgrep | Scan completed; 31 findings |
| Trivy | Workflow step configured; result pending verification |
| Docker image build | Verified |
| Docker Compose local deployment | Healthy |
| Swagger API check | HTTP 200 verified |
| Terraform AWS configuration | Validate and plan verified; data lookup only |
| GHCR publishing | Not implemented yet |
| Kubernetes / K3s deployment | Not implemented yet |
| Prometheus / Grafana | Not implemented yet |

## Next steps
1. Verify and retain the Trivy scan output.
2. Add a repeatable Docker build and image publishing workflow to GHCR.
3. Prepare Kubernetes manifests and deploy to a suitable environment.
4. Add Prometheus and Grafana monitoring.
5. Add deployment verification and rollback steps.

## Evidence policy
Attach genuine screenshots or logs from the actual runs. Each item should show the relevant command, workflow run, or application response. Do not use mock screenshots or describe planned features as completed.
