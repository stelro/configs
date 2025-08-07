# Configuration Files

My configuration files for work and personal use.


## Neovim Keyboard Shortcuts

| Key Binding | Mode | Description |
|-------------|------|-------------|
| **File & Buffer Management** |
| `<leader>p` | Normal | Open file search dialog |
| `<leader>gg` | Normal | Search for files in project directory |
| `<leader>bb` | Normal | List and switch between buffers |
| `<leader>a` | Normal | List and switch between buffers |
| `<leader>w` | Normal | Save current file |
| `<leader>bd` | Normal | Close (delete) current buffer |
| `gt` | Normal | Switch to next buffer |
| `tg` | Normal | Switch to previous buffer |
| `;` | Normal | Enter command mode (`:`) |
| **Window Management** |
| `<leader>w/` | Normal | Split window vertically |
| `<leader>wd` | Normal | Close/hide current window pane |
| `<leader>el` | Normal | Cycle between split windows |
| `<leader>wl` | Normal | Switch to next window (NvChad) |
| `<C-n>` | Normal | Toggle file explorer |
| **Text Editing** |
| `<leader>dd` | Normal | Duplicate current line |
| `<leader>kk` | Normal | Swap line with line above |
| `<leader>jj` | Normal | Swap line with line below |
| `<leader>/` | Normal | Toggle comment on current line |
| `<leader>/` | Visual | Toggle comments on selected lines |
| **Search & Navigation** |
| `<leader>f` | Normal | Search in project (Rg) / Format buffer (LSP) |
| **LSP & Diagnostics** |
| `<leader>e` | Normal | Open floating diagnostic window |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |
| `<leader>q` | Normal | Set location list with diagnostics |
| `gD` | Normal | Go to declaration |
| `gd` | Normal | Go to definition |
| `K` | Normal | Show hover information |
| `gi` | Normal | Go to implementation |
| `<C-k>` | Normal | Show signature help |
| `<leader>r` | Normal | Rename symbol |
| `<leader>t` | Normal/Visual | Code actions (LSP) |
| `gr` | Normal | Show references |
| `<leader>wa` | Normal | Add workspace folder |
| `<leader>wr` | Normal | Remove workspace folder |
| **Spell Checking** |
| `<leader>sc` | Normal | Enable spell check (US English) |
| `<leader>sd` | Normal | Disable spell check |
| **Development** |
| `<leader>of` | Normal | Switch between source/header files |
| `<leader>db` | Normal | Toggle debugger breakpoint |
| `<leader>dr` | Normal | Start/continue debugger |
| `<leader>rcu` | Normal | Upgrade all Rust crates |
| **Completion** |
| `<Tab>` | Insert | Select next completion item |
| `<S-Tab>` | Insert | Select previous completion item |
| `<CR>` | Insert | Confirm completion selection |
| **Special Keys** |
| `<F1>` | Normal/Insert | Disabled (mapped to Esc) |
| `jk` | Insert | Exit insert mode (NvChad) |

**Leader key**: `<Space>` (Space bar)
