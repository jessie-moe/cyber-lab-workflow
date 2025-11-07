# Security and Responsible Disclosure

## Overview
This repository is used for cybersecurity learning and controlled lab testing.
All testing must occur in **isolated environments** that are not connected to production or public networks.

## Reporting Vulnerabilities
If you identify a genuine vulnerability in scripts, configurations, or documentation:
1. **Do not** post details publicly.
2. Email the repository maintainer at `contact@jessie-moe.dev` (replace with preferred contact).
3. Provide:
   - A short description of the issue
   - Steps to reproduce
   - Suggested remediation (if applicable)

Reports will be reviewed and confirmed in private before any disclosure.

## Safe-Testing Rules
- Use only virtual networks (host-only or NAT-internal).
- Never expose Bastion or Monitor VMs to the internet.
- Sanitize or redact logs before committing them to the repo.
- Avoid storing any credentials, keys, or real production data.

## Acknowledgments
Following responsible disclosure keeps this project safe for research and learning.
