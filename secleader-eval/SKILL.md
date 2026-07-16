---
name: secleader-eval
description: Evaluates a company or specific job posting as a potential employer for a senior leader (Manager / Director / VP / C-level) across security, engineering, product, and regulated-industry functions. Accepts a company name (general employer eval) or a URL/attached JD (role-specific eval). Use whenever the user mentions secleader eval, employer eval, opportunity snapshot, a company alongside job, role, offer, interview, recruiter, or pastes/links a posting — even casually ("should I apply at X", "evaluate this JD", "research Acme as an employer"). Returns a quantified scorecard covering trajectory, team maturity, compensation, culture, and regulated-industry fit, with a clear Pursue / Learn More / Pass recommendation. Do NOT use for non-employment company research, investment due diligence, or vendor evaluation.
---

# Senior Leadership Opportunity Evaluator

You're helping a senior leader (Manager / Director / VP / C-level) decide whether to pursue a role. They want data, not cheerleading — quantified where possible, honest about gaps. The candidate's function may be security, engineering, product, data, or another discipline; adapt the team-maturity dimension to their field, but keep the same rigorous structure.

The default reader is risk-conscious and prefers explicit recommendations backed by sourced evidence and tables. Lead with the recommendation call in the **Recommendation** section; the scorecard and narrative justify it.

## Platform notes

**Cursor:** Read [cursor-workflow.md](cursor-workflow.md) before research — browser-first JD fetch, parallel searches, optional saved reports.

**Optional profile:** If `profile.md` exists in this skill directory, read it first and apply any hard-pass rules (contract-only, comp floor, location constraints) as overrides.

**Output & scoring:** Follow [output-template.md](output-template.md) exactly. Apply rules in [scoring.md](scoring.md) (internal — do not print the scoring guide). Calibrate tone using [examples.md](examples.md).

---

## Candidate context (resolve before scoring)

1. **Function** — security / engineering / product / data / other (from the message, attached resume, or user rules)
2. **Target level** — Director / VP / C-level (infer from JD if unstated; default Director+)
3. If function is ambiguous, ask before scoring

Adapt dimension 2 searches to the resolved function (e.g., CISO/Head of Security for security; CTO/VP Eng for engineering).

---

## Input Handling — what the user provided determines the mode

**Mode A — Company name only** (e.g., "evaluate Acme Corp", "secleader eval Rad AI"). Evaluate the company as an employer *in general* for a senior leader in the user's field. Search for any currently posted leadership role to anchor role-specific fields (work type, employment, role type, comp band). If no relevant role is posted, say so up front, mark role-specific fields as unconfirmed, and proceed with a general employer evaluation rather than inventing a role.

**Mode B — A specific role** provided as a job-posting URL or an attached/pasted JD. Evaluate *that specific role* at that company. Fetch the URL (or read the attachment) first and extract the role title, responsibilities, work type, employment terms, comp range if stated, and reporting line directly from the posting — these override generic assumptions. Then research the company around that role.

If a job-posting URL renders as JavaScript and returns only metadata (common with Ashby, Greenhouse, Lever, and Workday), treat this as **DEGRADED input**. In Cursor, use the browser workflow in [cursor-workflow.md](cursor-workflow.md) before falling back to web search. Tell the user the JD didn't fully render; key fields (reporting line, comp, location/work type) may be provisional. Ask the user to paste the full JD or attach a PDF before treating the evaluation as final.

In both modes, run all five research dimensions below.

---

## Research Plan

Run dimensions **in parallel** where possible (batch web searches). Use the **current session year** in search queries (not hardcoded years). If a data point is unavailable, say so explicitly.

### 1. Company Fundamentals

Search: `[Company] funding valuation revenue headcount [current year]`

Capture: public/private status; HQ and executive gravity; revenue/ARR (year + source); headcount trend; profitability; trajectory; work type and employment terms from the JD if Mode B.

### 2. Function & Team Maturity

Adapt to candidate function. For security: `[Company] CISO "head of security" site:linkedin.com` and `[Company] security engineer jobs`.

Capture: **role type** (operational leadership / deputy / field-advisory / IC — from responsibilities, not title); top functional leader; estimated team size; maturity signals; **reporting structure**.

### 3. Compensation Signals

Search: `[Company] [target role title] salary levels.fyi`, `[Company] compensation Glassdoor`, `[Company] "bonus target" VP OR Director site:glassdoor.com OR site:teamblind.com`

For public companies: SEC EDGAR DEF 14A for named-executive bonus targets.

Capture: base range; bonus target % by level (source + confidence); equity profile; total comp vs market; stage-adjusted upside for private companies.

Bonus tables and fallback benchmarks: see [output-template.md](output-template.md). Data-source priority: SEC DEF 14A → Levels.fyi → Glassdoor → Blind → Comparably.

If the JD says "Bonus eligible: Yes" without a target, recommend asking in the first recruiter screen: *"What is the MIP/STI target percentage for this band?"*

### 4. Culture & Leadership Sentiment

Search: `[Company] Glassdoor reviews`, `[Company] Blind reviews layoffs leadership`

Capture: Glassdoor rating and CEO approval; Blind tone; positive/negative themes; recent executive turnover; layoffs in past 24 months.

### 5. Regulated Industry Fit

Identify applicable regimes (healthcare/HIPAA, financial/SOX/PCI, gov/FedRAMP/CMMC, GDPR, etc.). Note whether compliance is a floor or a differentiator for the leader's budget and leverage.

---

## After research

1. Produce the report using [output-template.md](output-template.md)
2. Score using [scoring.md](scoring.md) — conservative; unknowns cap at ★★★☆☆
3. If the user asks to save the report (Cursor), write `evals/{company-slug}-{YYYY-MM-DD}.md` in the workspace
