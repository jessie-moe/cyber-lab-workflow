#!/usr/bin/env bash
# lab_validate.sh - quick validation summary for collected logs
# Usage: ./lab_validate.sh /path/to/logdir "~/Documents/gitHub/cyber_lab_workflow/bastion/logs/archive/raw_untagged/" 
# Make sure to change <lab_number> to lab number folder e.g. LAB002
# any <> brackets should be inspected for file and directory location before proper execution
# Future updates will address this. This is automated test script for cyber-lab-workflow repository and does not work as intended but will be corrected in future updates
# Author: Jessie Moe

set -euo pipefail
LOGDIR=${1:-.}
OUT=~/Documents/gitHub/cyber_lab_workflow/bastion/logs/LAB<lab_number>_validate_$(date +%s).txt //<lab_number> to Lab number 
echo "<lab_number> quick validation - $(date)" > "$OUT"

function header { echo; echo "=== $1 ===" | tee -a "$OUT"; }

header "User account changes (auth.log / passwd diffs)"
grep -a -E "useradd|adduser|usermod|userdel|deluser|new user" "$LOGDIR"/auth.log* 2>/dev/null | tee -a "$OUT" || echo "No useradd/usermod entries found" | tee -a "$OUT"

if [[ -f "<2_lab_prior-user_modification.log>" && -f "<last_lab-user_modification.log>" ]]; then  #This line should be coded better. This might force a rename and folder layout for better automation later usage is <2 lab prior>
  header "Diff /etc/passwd baseline -> after"
  comm -13 <(sort "<2_lab_prior-user_modification.log>") <(sort "<last_lab-user_modification.log>") | tee -a "$OUT" || true    #This line should be coded better. This might force a rename and folder layout for better automation later
else
  echo "No etc_passwd_baseline/after snapshots found; skipping" | tee -a "$OUT"
fi

header "APT / package activity"
grep -a -E "Start-Date:|Commandline:|Install:|Remove:|Upgrade:" "$LOGDIR"</apt/history.log>* 2>/dev/null | sed -n '1,120p' | tee -a "$OUT"
grep -a -E "install |upgrade |remove " "$LOGDIR"/<dpkg.log>* 2>/dev/null | tail -n 40 | tee -a "$OUT"

header "Sudo / privilege escalation"
grep -a "sudo:" "$LOGDIR"/<auth.log>* 2>/dev/null | tail -n 80 | tee -a "$OUT"

header "Failed / successful auth"
grep -a -E "Failed password|authentication failure|Invalid user" "$LOGDIR"/<auth.log>* 2>/dev/null | tail -n 80 | tee -a "$OUT"
grep -a -E "Accepted password|Accepted publickey|session opened for user" "$LOGDIR"/<auth.log>* 2>/dev/null | tail -n 80 | tee -a "$OUT"

header "File operations / suspicious commands"
grep -a -E "rm |mv |rmdir|mkdir|chown |chmod |unlink|dd |> |>> |scp |rsync " "$LOGDIR"/<auth.log>* "$LOGDIR"/<journal>* <"$LOGDIR"/syslog*> 2>/dev/null | sed -n '1,200p' | tee -a "$OUT"

header "Auditd highlights"  #Can comment out if going to do more in depth audit reporting
if ls "$LOGDIR"</audit*> 1>/dev/null 2>&1; then
  grep -a -E "USER_CMD|EXECVE|useradd|passwd" "$LOGDIR"</audit>* 2>/dev/null | sed -n '1,120p' | tee -a "$OUT"
else
  echo "No audit logs present" | tee -a "$OUT"
fi

echo; echo "Summary saved to $OUT"
