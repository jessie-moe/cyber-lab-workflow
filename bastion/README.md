# Bastion Host Overview

## Purpose
The Bastion (Jumpbox) serves as the **controlled entry point** to all internal lab VMs.
It enforces SSH policy, logging, and baseline hardening before access to internal systems.

## Configuration Summary
| Component | Function |
|------------|-----------|
| Debian 13.1 (Trixie) | Base OS |
| Users | `gitops` (collection), `aptusers` (update/maintenance) |
| Network | `enp0s3` = 192.168.0.60 (host access), `enp0s8` = 192.168.50.2 (internal) |
| Packages | `fail2ban`, `auditd`, `rsyslog`, `lynis`, `openssh-server` |

## Log Handling
- Local logs are stored temporarily under `/home/jessie/Documents /home/Docoments/Backups /home/Documents/Logs`.
- Logs are retrieved by the `gitops` user via SSHFS and stored on the host until proper central management established.
- The Bastion does **not** retain long-term logs.

## Related Labs
- [LAB 001 — Bastion Build](/docs/lab_notes/lab_001_initialization.md)
- [LAB 002 — Set Static IP](/docs/lab_notes/lab_002_connectivity_and_ip_persistence.md)

## Next Steps
- Implement SSH.
- Configure fail2ban
- Configure auditd
- Integrate log forwarding to `monitor_vm`.
