# wl.nvim
## Prerequisites
- **Neovim** ≥ 0.10 (recommended: 0.11+)
- **Git**
- **A Nerd Font** (for icons)
- **Node.js** (for LSP servers)
- **ripgrep** (for telescope grep)

## Keymaps

> Leader = `Space`. Modes: `n` normal, `i` insert, `v` visual, `x` visual-block, `o` operator-pending, `c` command-line, `t` terminal.

### General

| Key | Mode | Action |
| --- | --- | --- |
| `<Esc>` | n | Clear search highlight |
| `;` | n | Use `;` as `:` |
| `jk` | i | Exit insert mode (`<Esc>`) |
| `jk` / `<Esc><Esc>` | t | Exit terminal mode |
| `tn` | n | New tab |
| `tj` | n | Next tab |
| `tk` | n | Previous tab |
| `<leader>?` | n | Show buffer-local keymaps (which-key) |

### Terminal (toggleterm)

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>tt` | n/t | Toggle floating terminal |

### Telescope (search)

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>sf` | n | Find files |
| `<leader>sg` | n | Live grep |
| `<leader>sb` | n | List buffers |
| `<leader>sh` | n | Help tags |

### Neo-tree (file explorer)

| Key | Mode | Action |
| --- | --- | --- |
| `<C-e>` | n | Reveal / toggle file tree |
| `o` | tree | Open file |
| `<C-e>` | tree | Close window |

### Flash (motion)

| Key | Mode | Action |
| --- | --- | --- |
| `s` | n/x/o | Flash jump |
| `S` | n/x/o | Flash Treesitter |
| `r` | o | Remote Flash |
| `R` | o/x | Treesitter search |
| `<C-s>` | c | Toggle Flash search |

### LSP & Diagnostics

| Key | Mode | Action |
| --- | --- | --- |
| `K` | n | Hover documentation |
| `<leader>d` | n | Show diagnostic (float) |
| `<leader>q` | n | Diagnostics → location list |

### Completion (blink.cmp, `default` preset)

| Key | Mode | Action |
| --- | --- | --- |
| `<C-space>` | i | Open menu / show docs |
| `<C-n>` / `<C-p>` | i | Select next / previous |
| `<C-y>` | i | Accept |
| `<C-e>` | i | Hide menu |
| `<C-k>` | i | Toggle signature help |

### Supermaven (inline suggestions)

| Key | Mode | Action |
| --- | --- | --- |
| `<Tab>` | i | Accept suggestion |
| `<C-j>` | i | Accept word |
| `<C-]>` | i | Clear suggestion |

### Claude Code (`<leader>a`)

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>ac` | n | Toggle Claude |
| `<leader>af` | n | Focus Claude |
| `<leader>ar` | n | Resume Claude |
| `<leader>aC` | n | Continue Claude |
| `<leader>am` | n | Select model |
| `<leader>ab` | n | Add current buffer |
| `<leader>as` | v | Send selection to Claude |
| `<leader>as` | tree | Add file to Claude |
| `<leader>aa` | n | Accept diff |
| `<leader>ad` | n | Deny diff |
| `<leader>bp` | n | Launch with `--dangerously-skip-permissions` (bypass) |
