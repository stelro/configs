# Configuration Files

My configuration files for work and personal use.

## Dependencies

### Required Dependencies
- **fd** - Fast file finder (used by fzf for file searching)
- **fzf** - Fuzzy finder for files and buffers
- **ripgrep (rg)** - Fast text search tool
- **lldb** - Debugger for C/C++ (includes lldb-dap)

### Optional Dependencies
- **proximity-sort** - Sorts files by proximity to current file (enhances fzf)
- **bash-language-server** - LSP for shell scripts
- **ruff-lsp** - Python linter and formatter
- **clangd** - C/C++ language server
- **rust-analyzer** - Rust language server

### Installation Commands

#### Arch Linux
```bash
# Required dependencies
sudo pacman -S fd fzf ripgrep lldb

# Optional dependencies
sudo pacman -S clang # for clangd
yay -S proximity-sort # from AUR
npm install -g bash-language-server
pip install ruff-lsp
rustup component add rust-analyzer
```

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
| `s` | Normal/Visual/Operator | Leap forward to any location |
| `gs` | Normal/Visual/Operator | Leap backward to any location |
| `gS` | Normal/Visual/Operator | Leap to any location in any window |
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
| `<leader>dc` | Normal | Continue debugging |
| `<leader>ds` | Normal | Step over (debugger) |
| `<leader>di` | Normal | Step into (debugger) |
| `<leader>do` | Normal | Step out (debugger) |
| `<leader>dr` | Normal | Open debug REPL |
| `<leader>dt` | Normal | Terminate debugging |
| `<leader>du` | Normal | Toggle debug UI |
| `<leader>rcu` | Normal | Upgrade all Rust crates |
| **Completion** |
| `<Tab>` | Insert | Select next completion item |
| `<S-Tab>` | Insert | Select previous completion item |
| `<CR>` | Insert | Confirm completion selection |
| **Special Keys** |
| `<F1>` | Normal/Insert | Disabled (mapped to Esc) |
| `jk` | Insert | Exit insert mode (NvChad) |

**Leader key**: `<Space>` (Space bar)
