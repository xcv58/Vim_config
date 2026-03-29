#!/bin/zsh

set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "$0")/.." && pwd)

fail() {
  print -u2 -- "FAIL: $1"
  exit 1
}

cd "$repo_dir"

options_tmp=$(mktemp /tmp/vim-config-review-options.XXXXXX.txt)
syntax_tmp=$(mktemp /tmp/vim-config-review-syntax.XXXXXX.txt)
startup_tmp=$(mktemp /tmp/vim-config-review-startup.XXXXXX.log)
threshold_tmp=$(mktemp /tmp/vim-config-review-threshold.XXXXXX.txt)
small_tmp=$(mktemp /tmp/vim-config-review-small.XXXXXX.txt)
large_tmp=$(mktemp /tmp/vim-config-review-large.XXXXXX.txt)
small_mode_tmp=$(mktemp /tmp/vim-config-review-small-mode.XXXXXX.txt)
large_mode_tmp=$(mktemp /tmp/vim-config-review-large-mode.XXXXXX.txt)
markdown_tmp=$(mktemp /tmp/vim-config-review-markdown.XXXXXX.md)
markdown_startup_tmp=$(mktemp /tmp/vim-config-review-markdown-startup.XXXXXX.log)
trap 'rm -f "$options_tmp" "$syntax_tmp" "$startup_tmp" "$threshold_tmp" "$small_tmp" "$large_tmp" "$small_mode_tmp" "$large_mode_tmp" "$markdown_tmp" "$markdown_startup_tmp"' EXIT

dd if=/dev/zero of="$small_tmp" bs=1m count=2 status=none
dd if=/dev/zero of="$large_tmp" bs=1m count=11 status=none
cat > "$markdown_tmp" <<'EOF'
# Title

- item 1
- item 2

```vim
set number
```
EOF

if rg -n 'set\s+syntax=(on|off)' vimrc >/dev/null; then
  fail "vimrc still uses set syntax=on/off"
fi

if rg -n '^\s*command!\s+.*\bInit\b' vimrc >/dev/null; then
  fail "vimrc still defines :Init"
fi

if rg -n '^\s*filetype plugin( indent)? on' main.vim display.vim >/dev/null; then
  fail "manual filetype initialization still exists outside vim-plug"
fi

if rg -n '^\s*set\s+t_Co=' display.vim >/dev/null; then
  fail "display.vim still sets t_Co"
fi

if rg -n '^\s*let g:LargeFile' start_type.vim >/dev/null; then
  fail "start_type.vim still defines the unused g:LargeFile variable"
fi

if rg -n 'BufEnter \* silent! lcd %:p:h' main.vim >/dev/null; then
  fail "main.vim still changes cwd on every BufEnter"
fi

if ! rg -n "Plug 'preservim/nerdcommenter'" plug.vim >/dev/null; then
  fail "plug.vim still uses the stale nerdcommenter source"
fi

if rg -n 'vim-polyglot' plug.vim >/dev/null; then
  fail "plug.vim still declares vim-polyglot"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE \
  -c "redir! >$threshold_tmp | echo g:large_file_threshold | redir END" \
  -c qall! >/dev/null 2>&1

threshold=$(tr -d '[:space:]' <"$threshold_tmp")
if [[ "$threshold" != "10485760" ]]; then
  fail "large file threshold is not 10MB"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE \
  -c "redir! >$options_tmp | set foldmethod? clipboard? | redir END" \
  -c qall! >/dev/null 2>&1

if ! rg -q 'foldmethod=manual' "$options_tmp"; then
  fail "foldmethod is not manual"
fi

if ! rg -q 'clipboard=unnamedplus' "$options_tmp"; then
  fail "clipboard is not unnamedplus"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE \
  -c 'call SyntaxOn()' \
  -c "redir! >$syntax_tmp | echo exists(\"g:syntax_on\") | redir END" \
  -c qall! >/dev/null 2>&1

syntax_flag=$(tr -d '[:space:]' <"$syntax_tmp")
if [[ "$syntax_flag" != "1" ]]; then
  fail "SyntaxOn() does not enable syntax"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE "$small_tmp" \
  -c "redir! >$small_mode_tmp | echo exists(\":Files\") | echo &l:undofile | redir END" \
  -c qall! >/dev/null 2>&1

small_lines=("${(@f)$(awk 'NF { print }' "$small_mode_tmp")}")
if [[ "${small_lines[1]:-}" != "2" ]]; then
  fail "small files do not load normal mode commands"
fi
if [[ "${small_lines[2]:-}" != "1" ]]; then
  fail "small files do not keep undofile enabled"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE "$large_tmp" \
  -c "redir! >$large_mode_tmp | echo exists(\":Files\") | echo &l:undofile | echo &l:number | echo LargeFileModeStatusline() | redir END" \
  -c 'setlocal undofile' \
  -c "redir! >>$large_mode_tmp | echo &l:undofile | echo LargeFileModeStatusline() | redir END" \
  -c qall! >/dev/null 2>&1

large_lines=("${(@f)$(awk 'NF { print }' "$large_mode_tmp")}")
if [[ "${large_lines[1]:-}" != "0" ]]; then
  fail "large files still load normal mode commands"
fi
if [[ "${large_lines[2]:-}" != "0" ]]; then
  fail "large files do not disable undofile by default"
fi
if [[ "${large_lines[3]:-}" != "0" ]]; then
  fail "large files still show line numbers by default"
fi
if [[ "${large_lines[4]:-}" != "large file mode - undofile disabled" ]]; then
  fail "large file statusline does not show undofile disabled"
fi
if [[ "${large_lines[5]:-}" != "1" ]]; then
  fail "large files cannot re-enable undofile manually"
fi
if [[ "${large_lines[6]:-}" != "large file mode - undofile enabled" ]]; then
  fail "large file statusline does not update after enabling undofile"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE \
  --startuptime "$startup_tmp" \
  -c qall! >/dev/null 2>&1

filetype_loads=$(rg -c '/runtime/filetype\.vim' "$startup_tmp")
if [[ "$filetype_loads" -gt 2 ]]; then
  fail "filetype.vim was sourced $filetype_loads times"
fi

vim -es -Nu "$repo_dir/vimrc" -i NONE "$markdown_tmp" \
  --startuptime "$markdown_startup_tmp" \
  -c qall! >/dev/null 2>&1

markdown_syntax_loads=$(rg -c '/runtime/syntax/markdown\.vim' "$markdown_startup_tmp")
if [[ "$markdown_syntax_loads" -gt 1 ]]; then
  fail "markdown syntax was sourced $markdown_syntax_loads times"
fi

markdown_polyglot_loads=$(rg -c 'vim-polyglot' "$markdown_startup_tmp" || true)
if [[ "$markdown_polyglot_loads" -gt 0 ]]; then
  fail "markdown startup still loads vim-polyglot"
fi

print -- "vim config review checks passed"
