# 🧩 LAB ### — Observations & Validation Report

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Observation ID:** | obs_lab001_bastion_validation |
| **Date:** | YYYY-MM-DD |
| **Author:** | Jessie Moe |
| **System(s):** | Bastion VM / Monitor VM / Target Host |
| **Log Source(s):** | `/bastion/logs/lab001_baseline`, `/monitor_vm/logs/syslog` |
| **Tools Used:** | journalctl, fail2ban-client, auditctl, grep, awk |
| **Objective:** | Validate system baselines, review logs for anomalies, confirm expected security behavior after configuration changes. |
