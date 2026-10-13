#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
fail=0
check_file() { if [ -f "$1" ]; then echo "PASS $1"; else echo "FAIL $1"; fail=1; fi; }
check_file AGENTS.md
check_file .agents/skills/content-strategist/SKILL.md
check_file config/creator-profile.md
check_file config/competitors.md
check_file config/editorial-policy.md
for skill in yt-script yt-viral yt-plan yt-package; do
  if [ -f ".agents/skills/$skill/SKILL.md" ]; then echo "PASS $skill installed"; else echo "PENDING $skill (run bash setup.sh on your Mac)"; fi
done
if [ -d vendor/yt-research-agent ]; then echo "PASS research repository downloaded"; else echo "PENDING optional research repository (run bash setup.sh on your Mac)"; fi
if [ "$fail" -ne 0 ]; then exit 1; fi
echo "Core Codex project: verified. External GitHub dependencies may still need installation."
