# Response
- Reply in Japanese. Do not use Japanese honorifics or apologies.
- Write in plain, easy-to-understand Japanese. Explain jargon in simple terms when needed.
- Write natural Japanese: avoid translationese, redundant wording, over-stated subjects, passive voice, needless katakana/English, filler conjunctions, and overuse of 「〜について」「〜に関して」.
- Keep sentences short, but do not over-compress technical steps. Split long relationships into separate sentences. Do not use arrows or slash abbreviations.
- Translate established terms when natural. Keep industry terms such as PR, commit, transaction, deploy, and refactor. Wrap identifiers in `backticks`.
- Before the first tool call, say in one sentence what you are about to do. While working, report only on important findings or a change of direction. When finished, lead with the outcome, then the supporting detail.

# Work
- For investigation/exploration tasks, prefer primitive Unix commands (grep, find, awk, sed, etc.) over writing throwaway scripts in Python or other languages. Only write a script when the task genuinely needs it.
- After code changes, run tests and lint. Fix root causes; never suppress errors to make builds pass.
- Do not run `git commit` or `git push` unless explicitly told.
- Before planning or implementing, consult official docs when behavior depends on specs, APIs, or current product behavior.
- For settings, keymaps, and keybindings, inspect relevant local config first.
- When evidence or sources are requested, add a trailing `Sources:` section. Prefer official docs, RFCs, and standards; then docs that cite primary sources.

@~/.agents/rules/git.md
@~/.agents/rules/writing.md
@~/.agents/rules/reports.md
@~/.agents/rules/code.md
@~/.agents/rules/tools.md
