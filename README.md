# cyber-lab-workflow

Workflows and hardening recipes for virtual networks and virtual machines.

## Overview
This repository contains reproducible lab infrastructure, hardening playbooks, and automation for building isolated cyber labs (virtual machines, virtual networks, and image builds). The goal is to provide repeatable, auditable lab scenarios and hardening guidance suitable for learning, testing, and research.

## Quickstart
Prerequisites:
- Virtualization: VirtualBox, libvirt, or VMware (host machine)
- Target images / distributions: Debian 13.1 (Trixie), Kali Linux (including Kali Purple)
- Common tools used in examples: Fail2ban, rsyslog, auditd, OpenSSH, Lynis, tcpdump, SSHamble, nmap

Clone the repository:
```bash
git clone git@github.com:jessie-moe/cyber-lab-workflow.git
cd cyber-lab-workflow
```

## Repo layout
- [WORKFLOW](../workflow.md) This is where you will find the Labs, and follow the worklfow. Labs will link to all Audits, Artifacts, Logs, an observations
- README files will beplaced in every directory for additional information
- Bastion, Monitor_VM, HOST, attacker_VM etc..): Contain VM specific  logs and configuation change files between labs
- gloabl: Will include global settings / scripts / repo specific settings
- docs: Lab notes, Diagrams, resources, Templates, and Observations
- tests: Testing informoation: specific tests ran/lab with log reports
- tools: Contains additional links to tools and external applications used for testing and hardening
- THIS REPO WILL CHANGE OFTEN AND SO WILL THE FOLDER AND STRUCTURE. THIS SECTION WILL UPDATE AS CHANGES ARE MADE

## Safety and isolation
- Always run labs in isolated networks (host-only networks, private VPCs, or VM-only networks). Avoid connecting lab networks to production or corporate networks.
- Use ephemeral environments and snapshots to revert changes. Provide teardown scripts for each scenario.
- If using cloud resources, ensure proper IAM scoping and billing controls.

## Contributing
See CONTRIBUTING.md for contribution guidelines, testing, and PR expectations.

## License
This repository currently has no license file. If you plan to make content public, add a LICENSE (e.g., MIT, Apache-2.0). Private-use content is allowed, but consider licensing for shareable modules and playbooks.
