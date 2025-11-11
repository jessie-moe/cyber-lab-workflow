# 🧩 LAB ### — Observations & Validation Report

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Observation ID:** | obs_lab001_bastion_validation |
| **Date:** | 2025-11-11 |
| **Author:** | Jessie Moe |
| **System(s):** | Bastion VM |
| **Log Source(s):** | [LAB001-Logs](../../bastion/logs/archive)
|
| **Tools Used:** | USB Flash Drive | [Bastion](/bastion/README.md) |
| **Objective:** | Validate system baselines, review logs for anomalies, confirm expected security behavior after configuration changes. |

---

## 2. Observation Context

###Post change analysis

---

## 3. Collected Logs Overview

| Log File | Location | Purpose | Status |
|-----------|-----------|----------|---------|
| `auth.log` | `/var/log/auth.log` | Tracks login attempts | ✅ |
| `fail2ban.log` | `/var/log/fail2ban.log` | Ban/Unban actions | ✅ |
| `audit.log` | `/var/log/audit/audit.log` | System call auditing | ⚠️ Partial |
| `journalctl` Export | `/tmp/journalctl.log` | Kernel & system messages | ✅ |

*(Include hash checksums or SHA256 values for integrity validation if applicable.)*

---

## 4. Observations & Findings

Describe key log findings, anomalies, or expected results verified.

| Category | Observation | Expected Behavior | Actual Behavior | Status |
|-----------|--------------|-------------------|------------------|---------|
| Authentication | SSH brute force attempt detected | Fail2Ban bans IP | IP banned after 5 attempts | ✅ |
| Auditd | Root command execution logged | auditd records sudo | No entry for sudo commands | ⚠️ |
| Logging | rsyslog forwarding | Logs appear on monitor_vm | Working as intended | ✅ |

*(Include command outputs or snippets as fenced code blocks for clarity.)*

```bash
sudo journalctl -u fail2ban | grep "Ban"
