#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
command -v git >/dev/null || { echo 'git is required'; exit 1; }
mkdir -p .agents/skills vendor
if [ ! -d vendor/chatgpt-youtube-agent-skill/.git ]; then
  git clone --depth 1 https://github.com/Jakeschincariol/chatgpt-youtube-agent-skill.git vendor/chatgpt-youtube-agent-skill
else
  echo 'YouTube skill repo already present; not overwriting.'
fi
for skill in yt-script yt-viral yt-plan yt-package; do
  src="vendor/chatgpt-youtube-agent-skill/skills/$skill"
  if [ -d "$src" ] && [ -f "$src/SKILL.md" ]; then
    if [ ! -e ".agents/skills/$skill" ]; then
      cp -R "$src" ".agents/skills/$skill"
      echo "Installed $skill"
    else echo "Already installed: $skill"; fi
  else echo "Missing expected skill: $skill"; fi
done
if [ ! -d vendor/yt-research-agent/.git ]; then
  git clone --depth 1 https://github.com/IsaiahDupree/yt-research-agent.git vendor/yt-research-agent
else echo 'YouTube research repo already present; not overwriting.'; fi
printf '\nReady: open this folder with Codex. Research agent remains source-only until you opt in to its Python deps/API keys.\n'
