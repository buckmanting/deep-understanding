---
name: technical-deep-dive
description: Deliver an accurate, technically rigorous explanation of a system, method, or implementation, including mechanisms, interfaces, trade-offs, and limitations. Use for internals, architecture, mathematics, protocols, or engineering behavior.
---

# Technical Deep Dive

Explain the real mechanism at the level the learner needs. Start from a compact mental model, then expose the details that change behavior, correctness, performance, safety, or design choices.

## Focus the depth

Select the relevant dimensions rather than applying a fixed checklist:

- Components, representations, invariants, and interfaces.
- Control flow, data flow, lifecycle, or mathematical derivation.
- Normal behavior plus the important boundary cases and failure modes.
- Trade-offs, resource costs, observability, and operational consequences.
- Alternatives only when they clarify a decision or misconception.

Use exact terminology and define it on first material use. Include pseudocode, equations, commands, or code only when they illuminate the mechanism; label illustrative material so it is not mistaken for production guidance. Preserve version, platform, configuration, and workload assumptions that could change the answer.

For a current, implementation-specific, or consequential claim, verify it with authoritative primary sources and use `evidence-review` if the source appraisal itself matters. Use `visual-learning` when a system map, sequence, state model, or data flow would reduce cognitive load.
