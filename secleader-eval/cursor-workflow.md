# Cursor agent workflow

Use this when running in Cursor. Claude and other hosts can ignore this file.

## Mode B — JD URL fetch order

1. **`browser_navigate`** to the posting URL, then **`browser_snapshot`** (primary for Ashby, Greenhouse, Lever, Workday)
2. If login wall, captcha, or empty snapshot → ask user to paste JD text or attach PDF
3. **`WebFetch`** only for static HTML pages
4. **`WebSearch`** only to fill gaps — mark fields sourced this way as **provisional**

Do not treat WebFetch-only results as complete for JS-rendered ATS pages.

## Research parallelism

Batch independent searches across all five dimensions in a single turn where possible (multiple WebSearch / WebFetch calls in parallel).

## Public company comp

For public employers, check SEC EDGAR (DEF 14A CD&A) for named-executive bonus targets before relying on crowd-sourced estimates.

## Optional candidate profile

If `profile.md` exists alongside this skill (copy from `profile.example.md`), read it before scoring and apply hard-pass rules.

Location: `~/.cursor/skills/secleader-eval/profile.md` (personal install).

## Output delivery

- **Default:** full markdown report in chat (see [output-template.md](output-template.md))
- **On request:** write `evals/{company-slug}-{YYYY-MM-DD}.md` in the workspace
- **Canvas:** only if the user explicitly asks for an interactive or visual scorecard view

## Function ambiguity

If the user's discipline is unclear, use AskQuestion with options: Security, Engineering, Product, Data, Other.
