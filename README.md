# Deep Understanding Skills

A composable learning toolkit for Codex. `deep-understanding` is the teaching router; the remaining skills add a particular kind of depth when it helps.

## Install

Copy the six folders in `skills/` into your Codex skills directory:

```bash
cp -R skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Restart or begin a new Codex session so it discovers the new skills. To update an existing installation, replace the six corresponding folders.

`visual-learning` requires the existing `archify` skill to be available. It does not include, vendor, or reimplement Archify.

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
