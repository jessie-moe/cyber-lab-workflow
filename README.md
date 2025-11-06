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

## Repo layout
- labs/: infrastructure, global settings, configuration examples, and scripts
- Hardening/: hardening steps, collected logs, configuration changes, analysis and playbooks
- Docs/: technical information, runbooks, resources, changelogs, and notes
- .github/: issue & PR templates, workflows, and CI configuration
- examples/: ready-to-run scenarios and minimal reproducible configurations
- assets/: diagrams and images (referenced externally or via LFS)

## Safety and isolation
- Always run labs in isolated networks (host-only networks, private VPCs, or VM-only networks). Avoid connecting lab networks to production or corporate networks.
- Use ephemeral environments and snapshots to revert changes. Provide teardown scripts for each scenario.
- If using cloud resources, ensure proper IAM scoping and billing controls.

## Contributing
See CONTRIBUTING.md for contribution guidelines, testing, and PR expectations.

## License
This repository currently has no license file. If you plan to make content public, add a LICENSE (e.g., MIT, Apache-2.0). Private-use content is allowed, but consider licensing for shareable modules and playbooks.
