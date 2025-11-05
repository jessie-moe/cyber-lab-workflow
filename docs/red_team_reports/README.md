# Red Team Reports

This directory stores red team reconnaissance and testing reports.
Each report should be named with the pattern: YYYY-MM-DD_<target>_red_report.md.

Structure:
- YYYY-MM-DD_<target>_red_report.md — full markdown report with objectives, tools, commands used, raw outputs (or links), and findings.
- evidence/ — optional subfolder with raw scans, pcap files, or command outputs.

Guidelines:
- Avoid including sensitive credentials or private keys.
- Store large binaries (pcaps) under bastion/results/red_team/ or monitor_vm/results/red_team/ and reference them.
- Include timestamps, exact command lines, and environment context (e.g., "attacker VM on isolated-net 10.20.0.0/16").
