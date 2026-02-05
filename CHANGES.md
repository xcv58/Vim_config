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
| `dense-analysis/ale` | Async linting engine (lazy-loaded) |
| `liuchengxu/vim-which-key` | Keybinding help popup (lazy-loaded) |

## Removed Plugins

| Plugin | Reason |
|--------|--------|
| `kien/ctrlp.vim` | Replaced by fzf (faster, more features) |
| `djoshea/vim-autoread` | Redundant - `set autoread` is sufficient |

## Deleted Files

| File | Reason |
|------|--------|
| `vundle.vim` | Legacy plugin manager, unused |
| `neobundle.vim` | Legacy plugin manager, unused |
| `ctrlp.vim` | Replaced by fzf.vim |
| `status_line.vim` | Dead code, redundant with airline |
| `latex.vim` | Unused, broken paths, vim-latex not installed |

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

**After:** Files larger than 1MB load in minimal mode. Files up to 1MB load with full configuration. Threshold is now consistent across all files (vimrc and start_type.vim).

### 3. Undo Persistence

**New Feature:** Undo history persists across vim sessions.

- Undo files stored in `~/.vim-undo/`
- Directory created automatically if it doesn't exist
- Can undo changes even after closing and reopening a file

### 4. CtrlP Replaced with fzf

**Before:** CtrlP fuzzy finder with `Ctrl-p`.

**After:** fzf fuzzy finder with the same `Ctrl-p` keybinding. fzf is faster and has more features.

### 5. Lazy Loading for Performance

Heavy plugins are now lazy-loaded to improve startup time:

- `vim-polyglot` - loads on first file read
- `ale` - loads on first insert mode entry
- `nerdtree` - loads on `:NERDTreeToggle`
- `vim-which-key` - loads on `\` press

### 6. 24-bit Color Support

Added `termguicolors` for modern terminal color support.

### 7. Line Numbers Enabled by Default

`set number` is now enabled by default in display.vim.

### 8. Simplified Indentation

Removed redundant `autoindent` and `cindent` - only `smartindent` is needed (it includes autoindent behavior).

### 9. Consistent Vim Syntax

Changed all `se` abbreviations to full `set` for consistency and readability.

### 10. MacVim-Only Code Isolated

MacVim-specific features (transparency toggle, tab navigation) are now properly guarded with `if has('gui_macvim')`.

### 11. Automatic Directory Creation

All required directories (`~/.vim-undo`, `~/.vim-tmp`, `~/.vim-view`) are now created automatically on startup if they don't exist.

### 12. Font Size Reduced

Reduced default GUI font size from 28pt to 18pt for more practical default.

## Keybindings

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

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `\a` | Normal | Previous buffer |
| `\d` | Normal | Next buffer |
| `\w` | Normal | Delete buffer |
| `Ctrl-h` | Normal | Previous buffer |
| `Ctrl-l` | Normal | Next buffer |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-j` | Normal | Move to window below |
| `Ctrl-k` | Normal | Move to window above |

### File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `\n` | Normal | Toggle NERDTree |

### Help

| Key | Mode | Action |
|-----|------|--------|
| `\` (wait) | Normal | Show which-key popup with all leader mappings |

### MacVim Only

| Key | Mode | Action |
|-----|------|--------|
| `\t` | Normal | Toggle transparency |
| `Cmd-u` | Normal | Toggle transparency |
| `Ctrl-Tab` | Normal | Next tab |
| `Ctrl-Shift-Tab` | Normal | Previous tab |
| `Cmd-1` to `Cmd-9` | Normal | Go to tab 1-9 |
| `Cmd-0` | Normal | Go to last tab |

### Command Line

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-p` | Command | Previous history |
| `Ctrl-n` | Command | Next history |
| `Ctrl-b` | Command | Move cursor left |
| `Ctrl-f` | Command | Move cursor right |

## Post-Installation

After applying these changes, run the following in vim:

```vim
:PlugInstall
:PlugClean
```

This will install new plugins and remove the old `vim-autoread` plugin.

## Dependencies

For best fzf performance, install one of:
- `ripgrep` (rg) - recommended
- `the_silver_searcher` (ag) - fallback

On macOS:
```bash
brew install ripgrep
```

## Lite Mode

For resource-constrained environments, use the lightweight configuration:

```bash
vim -u ~/.vim/lite.vim
```

This loads only essential plugins: airline, gitgutter, fugitive, supertab.
