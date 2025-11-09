# 🧩 LAB 001 — SSH Bastion / Jumpbox Initial Build

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Lab ID:** | bastion_build_001 |
| **Date:** | 2025-11-06 |
| **Author:** | Jessie Moe |
| **System:** | Debian 13.1 Trixie (bastion VM) |
| **Host Connection:** | Physical Access |
| **Repo Path:** | `/bastion/configs`, `/bastion/scripts`, `/bastion/logs/baseline` |
| **Lab Type:** | Initial Configuration / Baseline Lynis |
| **Objective:** | Establish a minimal Debian SSH bastion, install baseline security packages, and collect initial audit data for later hardening. |

---

## 2. Objective Summary

Initialize the bastion system for secure SSH management and baseline auditing.
This lab installs essential packages and SSH server only
Cconfigures foundational users,  Download base packages, and then captures the system’s first Lynis baseline.

---

## 3. Prerequisites

- [x] Debian .ISO  
- [x] Monitor_VM deployed  
- [x] Static external IP (e.g., `192.168.0.60`)  
- [x] Static internal IP (e.g., `192.168.50.2`)  
- [x] Diagram available: `/docs/diagrams/lab_topology.drawio`

---

## 4. Configuration Steps

### 4.1 Create `gitops` User
```bash
sudo adduser gitops --shell /usr/sbin/nologin
sudo mkdir /home/gitops/.ssh && sudo chmod 700 /home/gitops/.ssh
sudo touch /home/gitops/.ssh/authorized_keys
sudo chmod 600 /home/gitops/.ssh/authorized_keys
sudo chown -R gitops:gitops /home/gitops/.ssh
```

### 4.2 Create `aptcache` User
```bash
sudo adduser aptcache
sudo mkdir -p /var/cache/apt-mirror
sudo chown -R aptcache:aptcache /var/cache/apt-mirror
sudo chmod 750 /var/cache/apt-mirror
```

### 4.3 Install Core Packages
```bash
sudo apt update
sudo apt install lynis nftables fail2ban auditd rsyslog openssh-server -y
```

---

## 5. Validation Tasks

- [x] Ping `host` to verify connectivity  
- [x] Ping `monitor_vm` to verify connectivity  
- [x] Run initial Lynis baseline scan
- [x] Backup Logs / **HASH** all backups to ensure integrity
- [x] [LAB001-ANALYSIS](…/bastion/logs/LAB001/results.md)` Search parse and filter logs for user activity, network activity, and packages installed.

---

## 6. Results and Artifacts

| Artifact              | Log Path  | Validation Results | 
|-----------------------|-----------|--------------------|
| Lynis Baseline Report | [LynisLog](../bastion/logs/archive/raw_untagged/2025-11-08_lynis.log) | [LynisData](./bastion/logs/LAB001/results/2025-11-08_lynis-report.data.log) |
| Users:                | [User Accounts](../bastion/logs/archive/raw_untagged/2025-11-08_users.log)  | |
| Fail2Ban Local Config | `/bastion/configs/fail2ban.local` | |
| Ping Logs             | [LAB001-RESULTS-ICMP](../bastion/logs/LAB001/results/ICMP-RESULTS.log) | |
---

✅ **Objective Complete**
