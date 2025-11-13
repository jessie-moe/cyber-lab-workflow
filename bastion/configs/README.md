# cyber-lab-workflow
---
Workflows and hardening recipes for virtual networks and virtual machines.
---
## Overview
This repository contains reproducible lab infrastructure, hardening playbooks, and automation for building isolated labs (virtual machines, virtual networks, and image builds). The goal is to provide repeatable, auditable lab scenarios and hardening guidance suitable for learning, testing, and research.
---
## Current machine configuration (this directory)
This directory contains the current ../ machine configuration settings used during PRE and POST analysis and hardening workflows. These configurations represent the "last known good" state for testing, validation, and recovery.

Purpose:
- Store the active configuration files that will be applied to the machine before (PRE) and after (POST) analysis and hardening actions.
- Provide a canonical location for the configuration used during testing and analysis.

Usage:
- PRE-analysis: apply or compare current configs to the target system before running hardening/playbooks.
- During testing: use these configs as the baseline for automated and manual tests.
- POST-analysis: after hardening or changes, the resulting validated "last good" configuration is saved here.

Lifecycle and archival policy:
- After each POST-analysis run, the validated last-good configuration MUST be saved in this directory.
- Older or superseded configurations are moved to the archive directory (`archive/`) with timestamps and brief notes for future forensic or regression analysis.
- Archived configs are retained for audit and troubleshooting and should not be modified in-place.

Layout and notes:
- configs/ (this directory): active, current machine configuration files
- configs/archive/: timestamped historical configurations and notes
- Keep files small and well-documented (comments, changelog entries, or accompanying README fragments)
- Follow repository conventions for naming and versioning so automation can find and apply the last-good configuration.