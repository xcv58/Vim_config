# Vim Configuration Changes

## Overview

This document describes the modernization changes made to the vim configuration.

## New Plugins

| Plugin | Description |
|--------|-------------|
| `tpope/vim-surround` | Surrounding manipulation (cs, ds, ys commands) |
| `tpope/vim-repeat` | Make plugin commands repeatable with `.` |
| `preservim/nerdtree` | File explorer (lazy-loaded) |
| `junegunn/fzf` | Fuzzy finder core |
| `junegunn/fzf.vim` | Fuzzy finder vim integration |
| `dense-analysis/ale` | Async linting engine |
| `liuchengxu/vim-which-key` | Keybinding help popup (lazy-loaded) |

## Removed Plugins

| Plugin | Reason |
|--------|--------|
| `kien/ctrlp.vim` | Replaced by fzf (faster, more features) |

## Deleted Files

| File | Reason |
|------|--------|
| `vundle.vim` | Legacy plugin manager, unused |
| `neobundle.vim` | Legacy plugin manager, unused |
| `ctrlp.vim` | Replaced by fzf.vim |

## New Files

| File | Purpose |
|------|---------|
| `fzf.vim` | fzf configuration |
| `whichkey.vim` | which-key configuration |

## Behavior Changes

### 1. Paste Mode Removed

**Before:** `set paste` was always enabled, which disabled autoindent.

**After:** Paste mode removed. Autoindent now works correctly. Use `set paste` temporarily when pasting formatted text if needed.

### 2. Large File Threshold Increased

**Before:** Files larger than 32KB loaded in minimal mode.

**After:** Files larger than 1MB load in minimal mode. Files up to 1MB load with full configuration.

### 3. Undo Persistence

**New Feature:** Undo history persists across vim sessions.

- Undo files stored in `~/.vim-undo/`
- Directory created automatically if it doesn't exist
- Can undo changes even after closing and reopening a file

### 4. CtrlP Replaced with fzf

**Before:** CtrlP fuzzy finder with `Ctrl-p`.

**After:** fzf fuzzy finder with the same `Ctrl-p` keybinding. fzf is faster and has more features.

## New Keybindings

### Quick Actions

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Escape to normal mode |
| `\s` | Normal | Save file (`:w`) |

### File Navigation (fzf)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-p` | Normal | Find files |
| `\f` | Normal | Find files |
| `\b` | Normal | Find buffers |
| `\g` | Normal | Grep with ripgrep |
| `\m` | Normal | Recent files (MRU) |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-j` | Normal | Move to window below |
| `Ctrl-k` | Normal | Move to window above |
| `\h` | Normal | Move to window left |
| `\l` | Normal | Move to window right |
| `\j` | Normal | Move to window below |
| `\k` | Normal | Move to window above |

### File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `\n` | Normal | Toggle NERDTree |

### Help

| Key | Mode | Action |
|-----|------|--------|
| `\` (wait) | Normal | Show which-key popup with all leader mappings |

## Existing Keybindings (unchanged)

| Key | Mode | Action |
|-----|------|--------|
| `\a` | Normal | Previous buffer |
| `\d` | Normal | Next buffer |
| `\w` | Normal | Delete buffer |
| `\t` | Normal | Toggle transparency |
| `Ctrl-h` | Normal | Previous buffer |
| `Ctrl-l` | Normal | Next buffer |

## Post-Installation

After applying these changes, run the following in vim:

```vim
:PlugInstall
```

This will install the new plugins:
- vim-surround
- vim-repeat
- nerdtree
- fzf
- fzf.vim
- ale
- vim-which-key

## Dependencies

For best fzf performance, install one of:
- `ripgrep` (rg) - recommended
- `the_silver_searcher` (ag) - fallback

On macOS:
```bash
brew install ripgrep
```
