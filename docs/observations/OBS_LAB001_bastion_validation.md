# 🧩 OBS-001 — Observations & Validation Report

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Observation ID:** | OBS_LAB001_bastion_validation |
| **Date Begin:** | 2025-11-11 |
| **Author:** | Jessie Moe |
| **System(s):** | Bastion VM |
| **Log Source(s):** | [Bastion_RAW](../../bastion/logs/archive/raw_untagged/) [Analysis_Logs](../../bastion/logs/LAB001/results/)|
| **Tools Used:** | USB Flash Drive [Bastion](../../bastion/README.md) |
| **Objective:** | Validate system baselines, review logs for anomalies, confirm expected security behavior after configuration changes. |

---

## 2. Logs used to make observations

| Date: | File | Location | Purpose | 
|------------|-----------------|-----------|-------------------------------------------------|
| 2025-11-08 | accounts.log | [Accounts](../../bastion/logs/archive/raw_untagged/2025-11-08_accounts.log) | View system accounts |
| 2025-11-08 | apthistory.log | [APT-Logs](../../bastion/logs/archive/raw_untagged/2025-11-08_apt-history.log) | View Package history |
| 2025-11-08 | auth.log| [Auth](../../bastion/logs/archive/raw_untagged/2025-11-08_auth.log) | Tracks login attempts and elevated command execution |  
| 2025-11-08 | journalctl.log | [Journalctl](../../bastion/logs/archive/raw_untagged/2025-11-08_journalctl.log) | system messages |  
| 2025-11-08 | ICMPCOMBINED.log | [ICMP](../../bastion/logs/archive/raw_untagged/2025-11-08_ICMP_COMBINED.log) | Ping tests |
| 2025-11-08 | lynis.log | [Lynis](../../bastion/logs/archive/raw_untagged/2025-11-08_lynis.log) |

---
*(Include hash checksums or SHA256 values for integrity validation if applicable.)*
---

## 3. Observation Context

### 3.1 Artifacts / Validation 
| Artifact              | Artifact # | Artifact Path      | Notes   | 
|-----------------------|--------|------------------------|----------------------|
| Lynis hardening Index / Baseline Audit Run | LYN-001 | [LYN-001](/bastion/logs/LAB001/results/Lynis/2025-11-10_LYN_001.log) | Successful Audit |
| LynisSSH Audit | LYN-002 | [LYN-002](/bastion/logs/LAB001/results/Lynis/2025-11-10_LYN_002.log) | Critical Vulnerabilities found |
| User Account Authentication | AUTH-001 | [AUTH-001](/bastion/logs/LAB001/results/Authentication/2025-11-13_AUTH_001.log)  | Authorized Activity |
| User Account Modification | ACT-001 | [ACT-001](/bastion/logs/LAB001/results/User-System-AccountChanges/2025-11-08_ACT-001.log) | |
| Privelage Escalation | SUD-001 | [SUD-001](/bastion/logs/LAB001/results/sudoUsage/2025-11-14_SUD-001.log) | |
| Package Install | PAC-001 | [PAC-001](/bastion/logs/LAB001/results/PackageInstalls/2025-11-14_PAC_001.log) | Confirmed |
| Service Control | SVC-001 | [SVC-001](/bastion/logs/LAB001/results/Systemd-ServiceControl/2025-11-12_SVC-001.log) | Critical: wpa_supplicant.service active |
|


---
|


### 3.2 Describe key log findings, anomalies, or expected results verified.

| Category | Observation | Expected Behavior | Actual Behavior | Status | Notes |
|-----------|--------------|-------------------------------------------|------------------------------|---|----------------------------|
| Authentication | Account Activity | 2 New system/user accounts    | 2 New system/user accounts | ✅ | |
| Network | Connectivity | IP `enp0s3` UP `192.168.0.60` IP `enp0s8` UP 192.168.50.2  | IP `enp0s3` UP `192.168.0.60` IP `enp0s8` UP 192.168.50.2 | ✅ ||
| Network | Connectivity | 0 packet loss| 0 packet loss  | ✅ | |
| System | Modification | APT packages Installed | APT packages and Dependencies Installed | ⚠️ | Dependencies installed were required. But not identified pre-install | 
| System | Account Activity | File Creation | Observed user `jessie`' modify and export files / directories using USB device| ⚠️ | Account risk creating user folder/files on Bastion| |
 | System | Account Activity | File Deletion | Observed user `jessie`' modify and export files / directories using USB device| ⚠️ | Files detected being deleted during log transfer |
 | System | Account Activity | File Export | Observed user `jessie`' modify and export files / directories using USB device| ⚠️ | Improper mv of files resulting in permission errors |
 |Audit | System Audit-Lynis | Index score: < 70 | Index score: 65 | ✅ | Baseline audit confirms need to mitigate and harden SSH services |
 | Service | wpa_supplicant | Disabled | Enabled | 🟥 | Mitigate ASAP 

### Follow Up on Warnings
- [X] Verify the need of an additional aptuser account - aptuser will facilitate _apt system user in repository cache.
- [X] Verify user file/folder creation and deletions - Improper commands and file manipulation resulted in flagged actions.
- [X] Verify export of Log files - Logs exported due to SSHFS and log forwarding not established.
- [X] Accounts requested created
- [X] Foward critical errors / observasations for mitigation


⚠️***In progess***⚠️
 - [x] Pull network/interfaces config file
 - [ ] Place all files in necessary folders
 - [ ] Review Logs for additional Findings
 - [ ] Add all Log paths and findings
 - [ ] verify links

 

 ✅ **Maintained by:** Jessie Moe  
📆 **Last Updated:** 2025-11-13
