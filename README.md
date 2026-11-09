# Deep Understanding Skills

A composable learning toolkit for Codex. `deep-understanding` is the teaching router; the remaining skills add a particular kind of depth when it helps.

## Install

These are portable `SKILL.md` packages. Clone the repository, choose one destination for your platform and scope, then copy all six folders from `skills/`. Avoid installing duplicate copies with the same names at the same scope: each platform resolves collisions differently.

```bash
git clone https://github.com/buckmanting/deep-understanding.git
cd deep-understanding
```

### Codex

| Scope | Destination |
| --- | --- |
| Project | `.agents/skills/` |
| Personal, cross-platform | `~/.agents/skills/` |
| Personal, Codex local runtime | `~/.codex/skills/` |

For the local Codex runtime, for example:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Start a new Codex session after installing.

### Claude Code

| Scope | Destination |
| --- | --- |
| Project | `.claude/skills/` |
| Personal | `~/.claude/skills/` |

```bash
mkdir -p ~/.claude/skills
cp -R skills/* ~/.claude/skills/
```

Start a new session, then invoke a skill with `/deep-understanding` or ask a matching question. Personal local skills do not load in Claude cloud or Cowork sessions; use Claude account-managed skills or a committed project skill for those sessions.

### Cursor

| Scope | Destination |
| --- | --- |
| Project | `.cursor/skills/` |
| Personal | `~/.cursor/skills/` |

```bash
mkdir -p ~/.cursor/skills
cp -R skills/* ~/.cursor/skills/
```

Cursor also discovers `.agents/skills/`, `.claude/skills/`, and `.codex/skills/`, but its native locations are usually clearest. Use `/deep-understanding` or `@` to attach a skill, or let Cursor select one when relevant.

### Gemini CLI

| Scope | Destination |
| --- | --- |
| Workspace | `.gemini/skills/` or `.agents/skills/` |
| Personal | `~/.gemini/skills/` or `~/.agents/skills/` |

```bash
mkdir -p ~/.gemini/skills
cp -R skills/* ~/.gemini/skills/
```

Run `/skills reload`, then `/skills list` in an interactive Gemini CLI session to confirm discovery. Workspace skills require a trusted workspace.

### GitHub Copilot

| Scope | Destination |
| --- | --- |
| Project | `.github/skills/`, `.claude/skills/`, or `.agents/skills/` |
| Personal | `~/.copilot/skills/` or `~/.agents/skills/` |

```bash
mkdir -p ~/.copilot/skills
cp -R skills/* ~/.copilot/skills/
```

Copilot supports skills in its cloud agent, CLI, app, and Visual Studio Code agent mode. Commit a project-scoped location to share the skills with a repository.

### Visual-learning dependency

`visual-learning` delegates a diagram or explainer to an available Archify skill. It does not include, vendor, or reimplement Archify; without Archify, it falls back to a textual explanation.

## Use

Ask naturally, or name a skill explicitly:

```text
Explain gradient descent with $deep-understanding.
Use $first-principles to explain public-key cryptography.
Give me a $technical-deep-dive on TCP congestion control.
Teach me the Kubernetes request path, then use $visual-learning.
Quiz me on Bayesian inference with $knowledge-testing.
Review the evidence behind this health claim with $evidence-review.
```

`deep-understanding` chooses specialists only when they improve the answer. You can always request or decline a specialist directly, such as “no quiz” or “make a visual”.

## Included Skills

| Skill | Purpose |
| --- | --- |
| `deep-understanding` | Teaches from foundations and routes to useful specialists. |
| `first-principles` | Derives a concept from definitions, assumptions, and constraints. |
| `technical-deep-dive` | Explains mechanisms, interfaces, trade-offs, and failure modes. |
| `visual-learning` | Selects and delegates an appropriate diagram or explainer to Archify. |
| `knowledge-testing` | Uses retrieval and feedback to reveal durable understanding. |
| `evidence-review` | Separates claims from evidence, uncertainty, and inference. |

## Validate

From a checkout containing these files:

```bash
./tests/validate.sh
```

The script uses Codex's validator when its Python YAML dependency is available, otherwise it runs the same structural checks through the system YAML parser. It does not evaluate teaching quality.
