# Project Evidence

Store genuine screenshots, logs, and exported reports from the actual project runs in this folder.

## Evidence checklist

- [ ] GitHub Actions run showing the workflow completed successfully.
- [ ] Pytest output showing 25 passing tests.
- [ ] Semgrep output showing the completed scan and its 31 findings.
- [ ] Trivy workflow output after a successful scan has been verified.
- [ ] Docker build output for `fastapi-sample:1.1`.
- [ ] `docker compose ps` showing `fastapi-app` as healthy.
- [ ] Swagger UI showing `GET /players/` returning HTTP 200.
- [ ] Terraform validate and plan output showing the region data lookup only.

## Suggested filenames

Use clear names such as:

- `github-actions-success.png`
- `pytest-25-passed.png`
- `semgrep-scan.png`
- `trivy-scan.png`
- `docker-build.png`
- `compose-healthy.png`
- `swagger-http-200.png`
- `terraform-plan.png`

Only add evidence after capturing it from the real tool or run. Redact tokens, passwords, account identifiers, and other secrets before committing screenshots or logs.

## Important
The current project has verified local Docker deployment and API functionality. It has not yet been deployed to AWS or Kubernetes. Evidence must reflect that distinction.
