# Changelog

## [0.1-init] – 2025-11-06
### Added
- Initial repository structure (`bastion/`, `monitor_vm/`, `docs/`, `tests/`, `global/`)
- Lab documentation templates (`global/templates/*`)
- Baseline lab notes (`lab_001_bastion_build.md`, `lab_001_set_IP_Persistance.md`)
- Workflow tracking file (`workflow.md`)
- Baseline logging and verification scripts

### Changed
- Normalized lab metadata and section order
- Updated `README.md` and `workflow.md` to reflect Phase 1 progress

### Planned
- Phase 2 SSH hardening (LAB 002)
- Configurations for bastion (`fail2ban.local`, `nftables.conf`, `sshd_config`)
- Baseline log automation and forwarding to `monitor_vm`
