# Coding Style

Write code for human brains. Working memory holds ~4 chunks — keep cognitive load low.

## Readability
- Extract complex conditionals into named intermediate variables (e.g. `isValid`, `isAllowed`, `isSecure`).
- Prefer early returns over nested ifs — keep the happy path linear.
- Prefer composition over deep inheritance.
- Stick to a minimal subset of language features; don't force readers to know obscure syntax.
- Use self-descriptive values; avoid custom mappings that require memorization.

## Comments
- Never write comments. If code needs explanation, fix the code: rename, extract, simplify.
- Keep existing comments as-is unless asked to change them.

## Structure
- Prefer deep modules (simple interface, complex functionality) over many shallow ones.
- Avoid shallow abstractions like `MetricsProviderFactoryFactory` — the name is more taxing than the implementation.
- Don't abuse DRY — a little duplication beats unnecessary dependencies.
- Avoid unnecessary layers of abstraction. Linear thinking is more natural.

## Example

Hard to read:
```
if val > someConstant
    && (condition2 || condition3)
    && (condition4 && !condition5) {
    ...
}
```

Better:
```
isValid = val > someConstant
isAllowed = condition2 || condition3
isSecure = condition4 && !condition5
if isValid && isAllowed && isSecure {
    ...
}
```
