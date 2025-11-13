# 🧩 LAB 002 — Static IP and Network Persistence

## 1. Metadata

| Field | Description |
|--------|--------------|
| **Lab ID:** | bastion_network_persistence_001 |
| **Date:** | 2025-11-06 |
| **Author:** | Jessie Moe |
| **System:** | Debian 13.1 Trixie (bastion VM) |
| **Host Connection:** | Physical Access |
| **Repo Path:** | `/bastion/configs`, `/bastion/scripts`, `/bastion/logs/baseline` |
| **Lab Type:** | Network Configuration |
| **Objective:** | Ensure persistent static IP assignments for bastion external and internal interfaces to maintain stable connectivity. |

---

## 2. Objective Summary

This lab ensures that the bastion host retains static IP configurations across reboots to provide consistent access from both host and internal network interfaces.

---

## 3. Prerequisites

- [x] Bastion VM deployed  
- [x] External network connected (`enp0s3` → Host)  
- [x] Internal network configured (`enp0s8` → Internal VM Network)  
- [x] Network diagram available in `/docs/diagrams/lab_topology.drawio`

---

## 4. Configuration Steps

### 4.1 Edit Network Interfaces
```bash
sudo nano /etc/network/interfaces
```

**Example configuration:**
```bash
# External interface (Host → Bastion)
auto enp0s3
iface enp0s3 inet static
    address 192.168.0.60
    netmask 255.255.255.0
    gateway 192.168.0.1
    dns-nameservers 8.8.8.8 8.8.4.4

# Internal interface (Bastion → Internal Network)
auto enp0s8
iface enp0s8 inet static
    address 192.168.50.2
    netmask 255.255.255.0
```

Save and exit the editor.

---

### 4.2 Restart Networking Services
```bash
sudo systemctl restart networking
sudo reboot
```

---

## 5. Validation Tasks

- [x] Verify static IP assignment with `ip a`  
- [x] Ping `host` (external)  
- [x] Ping `internal_vm`  
- [x] Confirm persistent configuration after reboot
- [ ] [LAB002-ANALYSIS]*(pending)*

---

 **In Progress**

✅ **Maintained by:** Jessie Moe  
📆 **Last Updated:** 2025-11-12