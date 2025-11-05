# Red Team Report Template

**Date:** YYYY-MM-DD  
**Author:** Name / Team  
**Target:** bastion | monitor_vm | web_vm  
**Environment:** (e.g., isolated lab network, VM snapshot tag, IPs)

## Objective
Short description of the test's purpose (reconnaissance, brute force, fingerprinting, etc.)

## Scope & Rules of Engagement
- Allowed: (list)
- Not allowed: (list)
- Notes about non-invasive requirements and production constraints.

## Tools & Versions
- nmap — command: `nmap ...`
- ssh-audit — command: `ssh-audit ...`
- hydra — version — command: `hydra ...`

## Commands Run (chronological)
Provide exact command lines with timestamps.

## Findings & Interpretation
High-level summary and interpretation.

## Evidence
Relative paths to raw outputs (e.g., ../bastion/results/red_team/nmap_bastion_baseline.txt)

## Impact Assessment
Attack surface & exploitability; suggestion for blue team mitigations.

## Recommendations & Next Steps
Short-term and long-term suggestions.

## Appendix
Small raw outputs, CVE references, etc.
