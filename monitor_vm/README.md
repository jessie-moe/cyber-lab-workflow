# Monitor VM Overview

## Purpose
The Monitor VM is the **central log collector and analysis node** for the cyber-lab network.
It receives forwarded logs from the Bastion and internal VMs for analysis and visualization.
The Monitor_VM will also be partitioned and set up to handle SSH CA handling and key rotations in future operations

## Configuration Summary
| Component | Function |
|------------|-----------|
| Debian-based system | Centralized monitoring host |
| Services | `rsyslog`, `fail2ban`, `auditd`, optional ELK or Graylog (future) |
| Storage | `/var/log/remote/<hostname>/` |
| Network | Internal 192.168.50.0/24 only — no direct external connectivity |

## Log Flow
1. Bastion forwards logs using `rsyslog` over TCP/UDP 514.
2. Monitor VM parses and archives incoming logs.
3. Optional visualization tools or scripts can query data for analysis.

## Related Labs
- [LAB 003 — Log Forwarding Setup](/docs/lab_notes/lab_003_log_forwarding.md)
- [LAB 004 — SSH Audit Review](/docs/lab_notes/lab_004_ssh_audit.md)

## Security
- Accepts logs only from internal subnet.
- Uses SSH key-based authentication for administrative access.
- Future: integrate alerting via Fail2Ban or custom Python log monitors.
- Implement Full remote logging and alerting capabilities
- Customize alerts for efficient reporting
