# 🧩 Cyber Lab Workflow Overview

## 1. Repository Context
The **Cyber Lab Workflow** project establishes a secure, version-controlled environment for documenting, testing, and automating security configurations.  
Each lab follows standardized templates and validates baselines through log collection and analysis.

This repository aims to show the hardening process and validation results throughout the process.
When Repository is completed all labs and files can be easily referenced and used to validate hardening results from blue/red team activities during each phase.

Initial base line logs will be stored on bastion then moved to monitor_vm where they will be retrieved and added to the repository. When secure services are established. This process will also be found in workflow.

Phases will have sub phases to complete required testing and labs needed to verify and validate tests. Including vulnerability scanning and detection with complete right ups and documentation of steps and workflow per labs.

---

## 2. Completed Steps ✅

| Phase | Task | Status | Related Lab |
|--------|------|---------|--------------|
| **Initialization** | Created repo structure (`bastion`, `monitor_vm`, `docs`, `tests`, `templates`) | ✅ Completed | — |
| **Documentation Standardization** | Normalized lab notes for consistency (`lab_001_bastion_build.md`, `lab_001_set_IP_Persistance.md`) | ✅ Completed | LAB 001 |
| **Template Development** | Added `/templates` directory with standardized templates and README | ✅ Completed | — |
| **Bastion Build** | Installed and configured Debian SSH bastion; added `gitops` and `aptusers` users | ✅ Completed | LAB 001 |
| **Network Configuration** | Established persistent IPs for Bastion (`enp0s3=192.168.0.60`, `enp0s8=192.168.50.2`) | ✅ Completed | LAB 001 |
| **Logging Infrastructure** | Installed baseline packages: `fail2ban`, `auditd`, `rsyslog`, `lynis` | ✅ Completed | LAB 001 |

---

## 3. In-Progress ⚙️

| Phase | Task | Target | Notes |
|--------|------|---------|-------|
| **SSH Configuration** | Harden SSH access, restrict root login, disable TCP forwarding | LAB 002 | Build upon `bastion_build` baseline |
| **User and Group Policy** | Define least privilege user groups for SSH and admin actions | LAB 002 | Use `gitops` as base role model, assign all user roles|
| **Baseline Log Retrieval** | Automate remote collection from Bastion to Host via `sshfs` | LAB 003 | Store logs under `/bastion/logs/baseline/results/` |
| **Monitoring Integration** | Forward logs to `monitor_vm` and verify visibility | LAB 003 | Confirm rsyslog forwarding works |

---

## 4. Planned Next Steps 🧭

| Phase | Task | Description | Planned Lab |
|--------|------|-------------|--------------|
| **SSH Hardening Audit** | Perform Lynis and manual checks for SSH compliance | LAB 004 | Document findings and improvements |
| **Automated Script Execution** | Use `/bastion/scripts/` to validate configs and retrieve logs | LAB 004 | Integrate with git hooks if possible |
| **Fail2Ban Jails & Log Review** | Validate ban triggers and log alerts | LAB 005 | Compare Fail2Ban logs pre/post SSH changes |
| **Network Hardening** | Implement nftables baseline and verify with `lynx` and audit logs | LAB 006 | Define rule set templates under `/bastion/configs` |
| **Change Logging** | Automate change entry creation for `/docs/change_logs/` | — | Script-driven versioning integration |

---

## 5. Version Control Workflow

```bash
# Example Commit Workflow
git add .
git commit -m "Updated LAB 001 and added templates"
git push origin main
```

**Branching Strategy:**
- `main` → stable, verified labs  
- `dev` → experimental or new lab builds  
- `feature/*` → focused updates (e.g., `feature/ssh-hardening`)

---

## 6. Notes
- Keep all lab documentation under `/docs/lab_notes/` using `lab_template.md`.  
- Always tag commits that align with completed labs (e.g., `v0.1-lab001`).  
- Store baseline logs externally (via Host) for compliance and isolation.  
- Update `workflow.md` whenever a new lab or configuration milestone is completed.

---

✅ **Maintained by:** Jessie Moe  
📆 **Last Updated:** 2025-11-06
