# Code
- Do not write code comments. Must not write code comments. This rule overrides any instinct to explain code inline, any framework/library convention that suggests docstrings, and any prior habit from training. No exceptions: no WHY comments, no TODOs, no section headers, no docstrings unless the project's public API requires them. Express intent through naming and structure instead.
- Follow [~/.claude/coding-style.md](/Users/hiroto.yuba/.claude/coding-style.md).
- Do not delete or rewrite existing comments unless asked.
- Before finishing, scan your diff line by line and delete every comment you added. Treat any comment found in your own diff as a rule violation to fix, not a style choice.

## Tests
- Write only necessary tests; prevent test bloat. A test is necessary when it pins behavior the current change introduces or modifies.
- Do not re-test logic already covered by a unit test at a higher layer (component/integration). Higher-layer tests should only prove the wiring, with the minimum number of cases.
- Do not add tests for pre-existing behavior the change does not touch.
