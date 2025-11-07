# 🧩 Templates Directory

This folder contains standardized templates for use across the **Cyber Lab Workflow** repository.  
Each template is designed to maintain consistency, documentation quality, and reproducibility across all lab environments.

---

## 📁 Template Overview

| File | Purpose |
|------|----------|
| **lab_template.md** | Use this template for new lab documentation. It includes metadata, objectives, configuration, validation, and result sections. |
| **config_template.md** | Use this to define reusable configuration files (e.g., `rsyslog.conf`, `fail2ban.local`, `nftables.conf`). Include the deployment path and verification commands. |
| **script_template.sh** | Starter shell script with structured logging and main function logic. Use for automation, log collection, or validation tasks. |
| **report_template.md** | Formal report template for findings, audits, or blue/red team summaries following a completed lab. |

---

## 🧱 Usage Examples

### Create a New Lab
```bash
cp templates/lab_template.md docs/lab_notes/lab_002_firewall_baseline.md
```

### Add a Configuration File
```bash
cp templates/config_template.md bastion/configs/fail2ban.local
```

### Build an Automation Script
```bash
cp templates/script_template.sh bastion/scripts/collect_logs.sh
chmod +x bastion/scripts/collect_logs.sh
```

### Document a Security Report
```bash
cp templates/report_template.md tests/hardening/reports/lynis_analysis.md
```

---

## 🧩 Notes
- Keep template formatting consistent across labs for readability and automation compatibility.  
- Update templates here first when improving documentation standards.  
- Always commit template updates with clear version notes in `/docs/change_logs`.

---

✅ **Maintained by:** Jessie Moe  
📆 **Last Updated:** 2025-11-06
