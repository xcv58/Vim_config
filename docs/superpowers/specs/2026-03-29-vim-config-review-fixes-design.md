# Vim Config Review Fixes Design

**Goal:** Fix the reviewed correctness, performance, and maintenance issues in this Vim config without changing the overall plugin set or keybinding style.

**Scope:**
- Correct the syntax helper behavior so it works in MacVim and terminal Vim.
- Remove redundant startup ownership for `filetype` and `syntax`.
- Replace the default expensive folding mode.
- Tighten cwd/view autocommands and align large-file handling around one shared threshold.
- Refresh stale plugin/docs references called out in the review.

**Non-goals:**
- Replacing vim-plug.
- Migrating the config to Neovim.
- Redesigning the plugin set beyond the specific stale reference fix.

**Approach:**
1. Keep vim-plug as the startup owner for `filetype plugin indent on` and `syntax enable`.
2. Make the syntax helper wrappers explicit and correct.
3. Shift the config toward modern Vim defaults where they do not break established behavior: `termguicolors`, `clipboard=unnamed`, and `foldmethod=manual`.
4. Add a small regression script so these review fixes stay enforced.
