# 🧩 Repo Audit Integration Commit 001 — 2025-11-07

**Author:** Jessie Moe  
**Scope:** Full repo structural upgrade to support audit-based change management.  

### Summary
- Implemented modular changelog structure for each system.  
- Updated all templates to use **Audit Score** instead of **Lynis Score**.  
- Added `/logs` evidence directories for Bastion & Monitor VM.  
- Introduced automated capture script (`bastion/scripts/capture_logs.sh`).  
- Added documentation templates for consistent change validation.

### Affected Labs
- LAB 001 — Bastion Build  
- LAB 002 — Connectivity & IP Persistence  

### Next Steps
- Configure `gitops` SSHFS pull and validate first captured logs.  
- Run `capture_logs.sh` post-SSH hardening to establish new audit baseline.  
- Begin monitor_vm log forwarding validation for LAB 003.
