# cyber-lab-workflow

Workflows and hardening recipes for virtual networks and virtual machines.

## Overview
This repository contains reproducible lab infrastructure, hardening playbooks, and automation for building isolated cyber labs (virtual machines, virtual networks, and image builds). The goal is to provide repeatable, auditable lab scenarios and hardening guidance suitable for learning, testing, and research.

## Quickstart
Prerequisites:
- Git
- Virtualization: VirtualBox, libvirt, or VMware (host machine)
- Target images / distributions: Debian 13.1 (Trixie), Kali Linux (including Kali Purple)
- Common tools used in examples: Terraform, Packer, Ansible, Vagrant, Fail2ban, rsyslog, auditd, OpenSSH

Clone the repository:
```bash
git clone git@github.com:jessie-moe/cyber-lab-workflow.git
cd cyber-lab-workflow
```

Try a minimal scenario (example layout — replace with the scenario you want to run):
```bash
cd labs/terraform/simple-lab
tf init
tf plan
# review the plan, then:
tf apply
# when finished:
tf destroy
```

## Repo layout
- labs/: infrastructure, global settings, configuration examples, and scripts
  - labs/terraform/
  - labs/ansible/
  - labs/packer/
- Hardening/: hardening steps, collected logs, configuration changes, analysis and playbooks
- Docs/: technical information, runbooks, resources, changelogs, and notes
- .github/: issue & PR templates, workflows, and CI configuration
- examples/: ready-to-run scenarios and minimal reproducible configurations
- assets/: diagrams and images (referenced externally or via LFS)

## Safety and isolation
- Always run labs in isolated networks (host-only networks, private VPCs, or VM-only networks). Avoid connecting lab networks to production or corporate networks.
- Use ephemeral environments and snapshots to revert changes. Provide teardown scripts for each scenario.
- Do NOT commit credentials, private keys, or other secrets. Use `.env.example` files and supply secrets at runtime or via CI secrets.
- If using cloud resources, ensure proper IAM scoping and billing controls.

## Security scanning & CI
We recommend enabling:
- Static analysis: linters for YAML, shell, and Terraform (yamllint, shellcheck, terraform fmt/validate)
- Security scanning: tfsec/checkov for Terraform, CodeQL for code scanning, Dependabot for dependencies
- Pre-commit hooks to catch accidental secrets and formatting issues

## Contributing
See CONTRIBUTING.md for contribution guidelines, testing, and PR expectations.

## License
This repository currently has no license file. If you plan to make content public, add a LICENSE (e.g., MIT, Apache-2.0). Private-use content is allowed, but consider licensing for shareable modules and playbooks.
