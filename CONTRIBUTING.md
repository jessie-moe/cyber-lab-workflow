# Contributing to cyber-lab-workflow

Thank you for contributing! This file describes how to propose changes, the preferred workflow, and standards to keep the repo consistent and secure.

## How to contribute
- Fork the repository (if public) or create a branch off main for changes (we use feature branches named like `feature/<short-description>` or `fix/<short-description>`).
- Make small, focused commits with clear messages.
- Keep contributions atomic and document rationale in the PR description.

## Branch and PR workflow
- Create a branch from main:
```bash
git checkout -b add-readme-contributing
```
- Push your branch and open a pull request against `main`.
- Include in the PR:
  - Summary of changes
  - Files changed and why
  - Any manual steps to validate or reproduce
- PRs should include automated CI results (linting, basic checks) before merging.

## Code and config style
- Terraform: run `terraform fmt` and `terraform validate` before committing.
- Ansible: follow best practices (roles, inventory separation). Run `ansible-lint`.
- Shell scripts: run `shellcheck` and use `shfmt` for formatting.
- YAML: run `yamllint` with a consistent config.
- Use meaningful, small commits and write clear commit messages.

## Tests and CI
- Add tests or validation where appropriate. For Ansible roles, consider Molecule scenarios.
- For Terraform modules, include examples and at least `terraform validate` in CI.

## Security and secrets
- Never commit secrets, API keys, or private keys to the repository.
- Use `.env.example` files to show required environment variables.
- Use GitHub Secrets (or equivalent) in CI to store sensitive data.
- If you discover a security issue, follow the process in SECURITY.md (if present). If SECURITY.md is not present, privately contact the repository owner.

## Issue reporting
- Open issues for bugs, enhancements, or scenario requests.
- Provide environment details, steps to reproduce, logs, and expected vs actual behavior.

## Licensing
- If you add code or content, ensure any dependencies or code you include are compatible with the repository license.
- If you want to contribute third-party content (e.g., images, VM boxes), make sure you have the right to redistribute it or host it externally and link to it.

## Maintainers
- Maintainers will review PRs and assign reviewers as needed.
- The repository may require at least one approving review and passing CI checks before merging.

Thanks again — contributions that improve reproducibility, documentation, or safety are especially appreciated.
