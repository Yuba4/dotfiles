# Response style
- Respond in Japanese.
- Do not use Japanese honorifics or apologies.

# Japanese writing style
- Avoid translationese. Don't mirror English syntax or word order.
- Cut redundant phrasing:
  - NG「〜することができます」→ OK「〜できる」
  - NG「〜する必要があります」→ OK「〜が必要」「〜する」
  - NG「〜という点において」→ OK「〜は」「〜で」
- Don't over-state the subject:
  - NG「私は〜と考えます」「あなたは〜してください」→ OK「〜と考える」「〜する」
- Prefer active voice over passive:
  - NG「〜が行われる」「〜がなされる」→ OK「〜する」
- Avoid unnecessary katakana loanwords (only the ones not yet established):
  - NG「コンファーム」「インプリメント」「リクワイアメント」
  - OK「確認」「実装」「要件」
  - Keep terms established in the industry as-is (プルリクエスト, デプロイ, リファクタ, etc.)
- Avoid translationese conjunctions:
  - NG「加えて」「さらに重要なことに」「しかしながら」
  - OK「また」「重要なのは」「ただし」「だが」
- Don't overuse「〜について」「〜に関して」; connect with particles instead.
- Use noun-ending sentences and short sentences; keep each sentence short.
- Avoid literal translations of English syntax:
  - NG「重要なことは X です」（It is important that...）→ OK「X が重要」
- In technical explanations, procedures, and progress notes, don't over-compress; write so the reader can follow it in one read:
  - Don't show relationships with arrows (→). Write with verbs, e.g.「A を B に移す」.
  - Don't pack multiple facts into one sentence with「、」or symbols. Split into separate sentences if it gets long.
  - Translate English words when an established translation exists (consumer→利用側, retire→廃止, fetch→取得, write→書き込み, read-only→読み取り専用, etc.). Keep words that read unnaturally when translated (PR, commit, transaction, etc.) as-is.
  - Don't use slash abbreviations (like write/tx); spell the words out.
  - Wrap identifiers such as function, type, and table names in `backticks` to separate them from prose.

# Workflow
- After code changes, run tests and lint. Fix failures before finishing.
- Never suppress errors to make builds pass — address root causes.
- Before planning or implementing, consult official docs. Don't rely solely on prior knowledge.
- When asked about settings, keymaps, or keybindings, don't answer from guesswork. Check the relevant local config files first.
- When asked for evidence/sources, include URLs in a trailing "Sources:" section.
  - Priority 1: official docs, RFCs, standards.
  - Priority 2: docs that cite primary sources (tech blogs, explainers).

# Coding style
See [~/.claude/coding-style.md](~/.claude/coding-style.md).

# Git & PR
- Do not run `git commit` or `git push` until explicitly told (「commitして」「コミットして」). Editing files / running tests / lint stays local.
- Before `git commit`, run the project's build and lint commands. Commit only after both pass; fix failures first.
- Commit messages: single line, no `Co-Authored-By`. Japanese.
- Commit message guide (https://github.com/RomuloOliveira/commit-messages-guide):
  - Imperative form (「修正」/「修正する」, not「修正した」)
  - Be specific (「テキストボックスの左パディングを拡大」, not「CSS調整」)
  - No vague wording (「色々修正」「バグ修正」, etc.)
  - Split commits into units that are easy for people to understand.
  - Write commit messages in clear Japanese.
  - Do not add aliases or prefixes such as `fix:` or `feat:`.
- PR creation:
  - Follow `.github/pull_request_template.md`.
  - Always pass `--draft` to `gh pr create`.
  - Do not write "generate with claude code".
- PR review: follow criteria & output format in `.github/workflows/claude-review.yml`.

# Tools
- GitHub URLs / GitHub ops → `gh` CLI.

