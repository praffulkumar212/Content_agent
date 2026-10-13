# Content Intelligence Agent

A niche-independent research and scripting workflow for the channels you supply. It uses evidence to build channel profiles, prioritize five ideas and draft a 45-second script. No social publishing is automated.

## Channels

- YouTube: https://www.youtube.com/@kushagra_singh10
- Instagram: https://www.instagram.com/kushagra_explores/

Channel content has not yet been analyzed. Do not infer niche, voice or performance without evidence.

## Setup

Run `bash setup.sh`, then `bash verify.sh`. Supporting skills live in `.agents/skills`. Optional Python research: create a virtual environment outside the checkout and install `./vendor/yt-research-agent[dev]`. Run its pytest suite from `vendor/yt-research-agent`.

Use the existing cloud checkout; do not create a worktree unless requested. Read AGENTS.md and config/ first. Credentials belong in environment settings, never in tracked files. Inspect signal counts: a zero-result pipeline is not validated research.

## Current validation

Four YouTube supporting skills installed; hook scorer executed; Python dependency check passed; research-agent fixture suite: 84 passed. Live channel research remains pending access and credentials. Previous design-template outputs are excluded from this repository.
