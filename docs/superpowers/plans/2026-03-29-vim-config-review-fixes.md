# Vim Config Review Fixes Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix the reviewed Vim config issues and lock them down with a small regression script.

**Architecture:** Keep the existing modular Vim layout, but simplify startup ownership so vim-plug controls syntax/filetype initialization. Use one shared large-file threshold, safer autocommands, and a repo-local shell check for the regressions.

**Tech Stack:** Vimscript, zsh, ripgrep, Vim 9.1

---

### Task 1: Add Regression Checks

**Files:**
- Create: `tests/vim_config_review.zsh`

- [ ] **Step 1: Write the failing regression checks**
- [ ] **Step 2: Run the script and verify it fails against the current config**

### Task 2: Fix Vim Startup and Runtime Settings

**Files:**
- Modify: `vimrc`
- Modify: `base.vim`
- Modify: `main.vim`
- Modify: `display.vim`
- Modify: `start_type.vim`
- Modify: `plug.vim`

- [ ] **Step 1: Correct syntax helpers and remove redundant startup initialization**
- [ ] **Step 2: Replace the default fold method and modernize clipboard/color settings**
- [ ] **Step 3: Tighten cwd and view autocommands and unify large-file handling**
- [ ] **Step 4: Run the regression script and startup timing checks**

### Task 3: Refresh Stale Metadata

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Remove stale version/platform/plugin references from docs**
- [ ] **Step 2: Re-run the regression script after doc/plugin-reference updates**
