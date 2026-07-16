# Install & use — Cursor Skills

## Install

### Option A — From GitHub Release

1. Download **`secleader-eval-cursor.zip`** from [GitHub Releases](https://github.com/mikhaelf/secleader-eval/releases).
2. Unzip and copy the `secleader-eval` folder to:

   ```
   ~/.cursor/skills/secleader-eval/
   ```

   The path must contain `SKILL.md` at `~/.cursor/skills/secleader-eval/SKILL.md`.

### Option B — From this repo

```bash
git clone https://github.com/mikhaelf/secleader-eval.git
cp -R secleader-eval/secleader-eval ~/.cursor/skills/secleader-eval
```

Or build the zip locally:

```bash
./scripts/package-skill.sh
# → dist/secleader-eval-cursor.zip
```

### Option C — Project skill (team sharing)

Copy `secleader-eval/` into your project's `.cursor/skills/secleader-eval/` so collaborators get the same skill from the repo.

## Invoke

Cursor discovers the skill from its description — no slash command required.

**Examples:**

- `@secleader-eval` then: `Acme Corp`
- `secleader eval Acme Corp`
- `should I apply at Acme? evaluate the VP Security role`
- Paste a JD URL or attach a PDF with `@secleader-eval`

The skill auto-invokes when you mention evaluating an employer, job posting, or interview opportunity.

## Optional: candidate profile

Personalize every eval without repeating preferences:

```bash
cp ~/.cursor/skills/secleader-eval/profile.example.md \
   ~/.cursor/skills/secleader-eval/profile.md
# Edit profile.md — function, comp floor, hard passes
```

## Cursor-specific features

The skill includes [cursor-workflow.md](../secleader-eval/cursor-workflow.md):

- **Browser-first JD fetch** for Ashby / Greenhouse / Lever / Workday
- **Parallel web research** across all five dimensions
- **Save report** — ask "save this eval" to write `evals/{company}-{date}.md` in your workspace

## Update

Re-copy the folder or re-download the release zip when you pull a new version. Your `profile.md` (if created) is preserved if you merge manually.

## Privacy

Eval inputs are processed by your Cursor agent and its configured model provider. This repository does not operate a backend or collect user data.
