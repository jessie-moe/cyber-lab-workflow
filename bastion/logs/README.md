# cyber-lab-workflow — LAB001 logs
-------
Workflows and hardening recipes for virtual networks and virtual machines.
-----------
## Purpose of this directory
This directory holds log output and analysis results produced for LAB001. It is a log/results directory — NOT the machine configuration directory.

Contents here are intended to store:
- Raw log dumps from PRE/POST runs (system logs, audit logs, packet captures, tool output).
- Processed results, summaries, and analysis artifacts derived from those logs.

## What is stored here
- logs/
  - raw/ — raw, unmodified log dumps and captures (retain original timestamps and filenames).
  - processed/ — parsed/normalized logs and intermediate data used by analysis tools.
  - reports/ — human-readable summaries, findings, and reports generated from analysis.
- artifacts/ — collected artifacts for this lab run (images, extracted files, evidence bundles).
- validations/ — validation outputs, checksums, policy-scan results, and automated test records.
Note: Artifacts and validations are maintained under each lab directory (e.g., bastion/logs/LAB001/artifacts/ and .../validations/).
*(directory strutcure subject to change. this is the projected tree. Scripting and meta data collection will determine final layout)*

## Usage
- PRE-analysis: place or compare PRE-run raw dumps in logs/raw/ for baseline assessment.
- During testing: processed logs, reports, artifacts, and validations support automated and manual review.
- POST-analysis: save final reports, validations, and any artifacts produced by the POST run in the corresponding directories.

## Lifecycle and archival policy
- Raw dumps in logs/raw/ MUST be preserved as-is for forensic traceability.
- After analysis completes, processed outputs, reports, artifacts, and validations should be moved into their respective directories under this lab.
- Older runs are moved to archive/ with timestamps and short notes. Archived items are retained for audit and should not be modified in-place.

## Notes and conventions
- Keep files small, named with clear timestamps and lab identifiers to allow automation to locate relevant runs.
-To keep logs short filter logs from previous 2 snapshots to recent. This will provide overlap for analysis and also keep logs up to date.
- Include short README fragments or changelog entries when adding archive items to aid future forensic or regression analysis.
