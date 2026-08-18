#!/usr/bin/env bash
set -uo pipefail

input=$(cat)
file=$(printf '%s' "$input" | jq -r '.tool_input.file_path // ""')

case "$file" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.go|*.py|*.rb|*.rs|*.java|*.kt|*.swift|*.c|*.h|*.cc|*.cpp|*.sh|*.bash|*.zsh|*.tf|*.sql|*.lua|*.vim) ;;
  *) exit 0 ;;
esac

pattern='^[[:space:]]*(//|#|/\*|\*[^/*]|--[[:space:]]|<!--)'
added=$(printf '%s' "$input" | jq -r 'if .tool_input.new_string != null then .tool_input.new_string else .tool_input.content // "" end')
old=$(printf '%s' "$input" | jq -r '.tool_input.old_string // ""')

new_comments=$(printf '%s\n' "$added" | grep -E "$pattern" | grep -v '^#!' | sort -u)
[ -z "$new_comments" ] && exit 0

old_comments=$(printf '%s\n' "$old" | grep -E "$pattern" | sort -u)
diff=$(comm -23 <(printf '%s\n' "$new_comments") <(printf '%s\n' "$old_comments"))
[ -z "$diff" ] && exit 0

jq -n --arg c "$diff" \
  '{decision:"block", reason:("追加行にコメントがある。削除してから続行する。既存コメントを移動しただけ、または文字列リテラルなら無視してよい:\n" + $c)}'
