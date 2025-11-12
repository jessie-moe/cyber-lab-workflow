# 🧩 LAB ### — Observations & Validation Report

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Observation ID:** | OBS_LAB001_bastion_validation |
| **Date Begin:** | 2025-11-11 |
| **Date End:** | |
| **Author:** | Jessie Moe |
| **System(s):** | Bastion VM |
| **Log Source(s):** | [LAB001](../../bastion/logs/archive/raw_untagged/) |
| **Tools Used:** | USB Flash Drive [Bastion](../../bastion/README.md) |
| **Objective:** | Validate system baselines, review logs for anomalies, confirm expected security behavior after configuration changes. |

---

## 2. Artifacts / Logs used to make observations

| File | Location | Purpose | Modified
|------------------------|-----------|----------|---|
| `auth.log` | [Auth](../../bastion/logs/archive/raw_untagged/2025-11-08_auth.log) | Tracks login attempts | ❌ |
| `journalctl` Export | [Journalctl](../../bastion/logs/archive/raw_untagged/2025-11-08_journalctl.log) | Kernel & system messages | ❌ |
| `network/interfaces` | [Interfaces](../../bastion/logs/archive/raw_untagged/2025-11-11_interfaces.bak) | Set IP| ✅ |
| `etc/passwd` | [Passwd](../../bastion/logs/archive/raw_untagged/2025-11-08_users.log) | Validate Accounts | ✅ |


*(Include hash checksums or SHA256 values for integrity validation if applicable.)*

## 3. Observation Context

### 3.1 Verification and Analysis
| File | Location | Result | Notes |
|--------------|------|-------|----------------------------------------|
| users.log | [Users](../../bastion/logs/LAB001/results/2025-11-08_LAB001-ANALYSIS-user_modification.log) | ✅ | `_apt` is a system created account, created by apt. It is a lower privileged account that could be used to manage the apt cache repository.|

### 3.2 Describe key log findings, anomalies, or expected results verified.

| Category | Observation | Expected Behavior | Actual Behavior | Status |
|-----------|--------------|-------------------------------------------|------------------------------|---------|
| Authentication | Account Activity | `gitops` `aptuser` | `gitops` `aptuser` | ✅ |
| Network | Connectivity | IP `enp0s3` UP `192.168.0.60` IP `enp0s8` UP 192.168.50.2  | IP `enp0s3` UP `192.168.0.60` IP `enp0s8` UP 192.168.50.2 | ✅ |
| Network | Connectivity | 0 packet loss| 0 packet loss  | ✅ |
| System | Modification | Install lynis, fail2ban, auditd | Install lynis, fail2ban, auditd | ✅ |
 

### Follow Up
- [ ] Verify the need of an additional aptuser account
- [x] Accounts requested created


⚠️***In progess***⚠️
 - [x] Pull network/interfaces config file
 - [x] Place all files in necessary folders
 - [ ] Review Logs for additional Findings
 - [ ] Add all Log paths and findings
 - [ ] verify links
