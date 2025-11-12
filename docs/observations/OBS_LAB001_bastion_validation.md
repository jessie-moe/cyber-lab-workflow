# 🧩 LAB ### — Observations & Validation Report

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Observation ID:** | OBS_LAB001_bastion_validation |
| **Date:** | 2025-11-11 |
| **Author:** | Jessie Moe |
| **System(s):** | Bastion VM |
| **Log Source(s):** | [LAB001-Logs](../../bastion/logs/archive)
| **Tools Used:** | USB Flash Drive | [Bastion](/bastion/README.md) |
| **Objective:** | Validate system baselines, review logs for anomalies, confirm expected security behavior after configuration changes. |

---

## 2. Observation Context

###Verification and Analysis
The following snippets are command used to verify results. Unnecessary info will be removed here. The raw logs will still contain full output

```bash
grep -a -E "useradd|adduser|usermod|deluser|userdel|new user" cyber-lab-workflow/bastion/logs/archive/raw_untagged/2025-11-08_journalctl.log
Nov 06 14:48:11 bastion sudo[872]:   jessie : TTY=tty1 ; PWD=/home/jessie ; USER=root ; COMMAND=/usr/sbin/adduser gitops --shell /usr/sbin/nologin
Nov 06 14:48:11 bastion adduser[875]: Adding user `gitops' ...
Nov 06 14:48:11 bastion useradd[884]: new user: name=gitops, UID=1001, GID=1001, home=/home/gitops, shell=/usr/sbin/nologin, from=/dev/pts/0
Nov 06 14:48:11 bastion adduser[875]: Creating home directory `/home/gitops' ...
Nov 06 14:49:13 bastion adduser[875]: Adding new user `gitops' to supplemental / extra groups `users' ...
Nov 06 14:49:13 bastion adduser[875]: Adding user `gitops' to group `users' ...

Nov 06 14:59:10 bastion sudo[976]:   jessie : TTY=pts/0 ; PWD=/home/gitops/.ssh ; USER=root ; COMMAND=/usr/sbin/adduser aptuser
Nov 06 14:59:10 bastion adduser[983]: Adding user `aptuser' ...
Nov 06 14:59:10 bastion adduser[983]: Adding new group `aptuser' (1002) ...
Nov 06 14:59:10 bastion adduser[983]: Adding new user `aptuser' (1002) with group `aptuser (1002)' ...
Nov 06 14:59:10 bastion useradd[992]: new user: name=aptuser, UID=1002, GID=1002, home=/home/aptuser, shell=/bin/bash, from=/dev/pts/1
Nov 06 14:59:10 bastion adduser[983]: Creating home directory `/home/aptuser' ...
Nov 06 14:59:38 bastion adduser[983]: Adding new user `aptuser' to supplemental / extra groups `users' ...
Nov 06 14:59:38 bastion adduser[983]: Adding user `aptuser' to group `users' ...
```

***Confimation requires Validation***


```bash
grep -a -E "git|apt" 
_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
gitops:x:1001:1001:,,,:/home/gitops:/usr/sbin/nologin
aptuser:x:1002:1002:,,,:/home/aptuser:/bin/bash
```
`_apt` is a system created account, created by apt. It is a lower privileged account that could be used to manage the apt cache repository.

- [ ] Verify the need of an additional aptuser account
- [x] Accounts requested created

---
###APT Packages

---

## 3. Artifacts used to make observations

| File | Location | Purpose | Modified
|------------------------|-----------|----------|---|
| `auth.log` | [Auth](../../bastion/logs/archive/raw_untagged/2025-11-08_auth.log) | Tracks login attempts | ❌ |
| `journalctl` Export | [Journalctl](../../bastion/logs/archive/raw_untagged/2025-11-08_journalctl.log) | Kernel & system messages | ❌ |
| `network/interfaces` | [path to file] | Set IP| ✅ |
| `etc/passwd` | [Passwd](../../bastion/logs/archive/raw_untagged/2025-11-08_users.log) | Validate Accounts | ✅ |


*(Include hash checksums or SHA256 values for integrity validation if applicable.)*

---

## 4. Observations & Findings

Describe key log findings, anomalies, or expected results verified.

| Category | Observation | Expected Behavior | Actual Behavior | Status |
|-----------|--------------|-------------------------------------------|------------------------------|---------|
| Authentication | Account Activity | `gitops` `aptuser` | `gitops` `aptuser` | ✅ |
| Network | Connectivity | IP `enp0s3` UP `192.168.0.60` IP `enp0s8` UP 192.168.50.2  | IP `enp0s3` UP `192.168.0.60` IP `enp0s8` UP 192.168.50.2 | ✅ |
| Network | Connectivity | 0 packet loss| 0 packet loss  | ✅ |
| System | Modification | Install lynis, fail2ban, auditd | Install lynis, fail2ban, auditd | ✅ |

⚠️***In progess***⚠️
 - [ ] Pull network/interfaces config file
 - [ ] Place all files in necessary folders
 - [ ] add relevant findings to report
 - [x] verify links
