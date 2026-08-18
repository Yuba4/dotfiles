#!/usr/bin/env bash
set -uo pipefail

cmd=$(jq -r '.tool_input.command // ""')

deny() {
  jq -n --arg r "$1" \
    '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:$r}}'
  exit 0
}

hit()  { printf '%s' "$cmd" | grep -qE "$1"; }
hiti() { printf '%s' "$cmd" | grep -qiE "$1"; }

SEP='(^|[[:space:];&|(`])'

hit "${SEP}rm[[:space:]]+(-[A-Za-z-]+[[:space:]]+)*(-[A-Za-z]*[rR]|--recursive)" &&
  deny '再帰的な rm は禁止。個別ファイルの削除か、ユーザーに依頼する。'

hit "${SEP}dd([[:space:]]|\$)" &&
  deny 'dd は禁止。'

hit "${SEP}(mkfs(\.[A-Za-z0-9]+)?|shred)([[:space:]]|\$)" &&
  deny 'mkfs / shred は禁止。'

hit "${SEP}(chmod|chown)[[:space:]]+(-[A-Za-z]+[[:space:]]+)*(-[A-Za-z]*R|--recursive)" &&
  deny '再帰的な chmod / chown は禁止。対象を個別に指定する。'

hit "${SEP}find[[:space:]][^|;&]*-delete([[:space:]]|\$)" &&
  deny 'find -delete は禁止。削除対象を確認してから個別に消す。'

hit '(^|[^>])>[[:space:]]*"?[^[:space:]<>|;&]*\.(ts|tsx|js|jsx|mjs|cjs|go|py|rb|rs|java|kt|swift|c|cc|cpp|h|hpp|php|sql|sh)"?([[:space:]]|$)' &&
  deny 'リダイレクトでソースファイルを上書きしない。Write / Edit ツールを使う。'

hit "${SEP}sudo([[:space:]]|\$)" &&
  deny 'sudo は禁止。必要ならユーザーに依頼する。'

hit "${SEP}((npm|pnpm|yarn)[[:space:]]+publish|twine[[:space:]]+upload|gem[[:space:]]+push|cargo[[:space:]]+publish)([[:space:]]|\$)" &&
  deny 'パッケージの公開コマンドは禁止。'

hit "${SEP}(npm|pnpm)[[:space:]]+(i|install|add|un|uninstall|rm|remove|update|up|link)[[:space:]][^|;&]*(-g|--global)([[:space:]]|\$)" &&
  deny 'パッケージのグローバルインストールは禁止。プロジェクトローカルに入れる。'

hit "${SEP}yarn[[:space:]]+global([[:space:]]|\$)" &&
  deny 'パッケージのグローバルインストールは禁止。プロジェクトローカルに入れる。'

hit "${SEP}aws[[:space:]][^|;&]*([[:space:]](delete|terminate|remove|revoke|deregister|release|purge|put|create|update|modify|stop|reboot|disable|rm|rb)[-a-z]*([[:space:]]|\$)|--delete)" &&
  deny 'aws の変更系サブコマンドは禁止。参照系（describe / get / list / ls）だけ使える。'

hit "${SEP}gcloud[[:space:]][^|;&]*[[:space:]](delete|create|update|remove|reset|stop)([[:space:]]|\$)" &&
  deny 'gcloud の変更系サブコマンドは禁止。参照系（describe / list）だけ使える。'

if hit "${SEP}(mysql|psql|sqlite3|mongosh|mongo|redis-cli)([[:space:]]|\$)"; then
  hiti '(drop[[:space:]]+(table|database|schema|index|view)|truncate|delete[[:space:]]+from|flushall|flushdb)' &&
    deny 'DB クライアント経由の DROP / TRUNCATE / DELETE は禁止。dbhub mcp を使うか、ユーザーに依頼する。'
fi

hit "${SEP}git[[:space:]]+([^|;&]*[[:space:]])?push[^|;&]*[[:space:]](-f|--force)([[:space:]]|\$)" &&
  deny 'git push --force は禁止。必要なら --force-with-lease を使い、ユーザーの指示を得る。'

hit "${SEP}git[[:space:]]+([^|;&]*[[:space:]])?reset[^|;&]*--hard" &&
  deny 'git reset --hard は禁止。未コミットの作業が消える。git stash などで退避する。'

hit "${SEP}git[[:space:]]+([^|;&]*[[:space:]])?clean[^|;&]*([[:space:]]-[A-Za-z]*f|--force)" &&
  deny 'git clean -f は禁止。-n で対象を確認し、削除はユーザーに依頼する。'

exit 0
