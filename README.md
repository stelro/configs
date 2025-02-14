My configuration files for work and personal use

- Neovim
- Kitty terminal for Linux and Mac (deprecated)
- Alacritty
- tmux for terminal multiplexer
- zsh (zshell) for work
- fish shell for personal use and Mac

# Neovim Key Bindings

Below is a complete list of key mappings that I use in my nvim configuration file.

---

## General & File/Buffer Navigation

- **`<Space>`**
  *Disables the space key’s default action to free it up as the leader key.*

- **Leader key (`<Space>`)**
  *Sets the leader key as space, used for all `<leader>` mappings.*

- **`<leader>p`**
  *Executes `:Files` to quickly open the file search dialog.*

- **`<leader>gg`**
  *Executes `:GGFiles` to search for files in your project directory.*

- **`<leader>b`**
  *Executes `:Buffers` to list and switch between open buffers.*

- **`<leader>w`**
  *Executes `:w` to save the current file.*

- **`;`**
  *Maps `;` to `:`, making it easier to enter command-line mode.*

- **`<leader>bd`**
  *Executes `:bd` to close (delete) the current buffer.*

- **`gt`**
  *Executes `:bnext` to switch to the next buffer.*

- **`tg`**
  *Executes `:bprev` to switch to the previous buffer.*

- **`<leader>el`**
  *Sends `<C-w>w` to cycle between split windows.*

---

## Window Management & Editing

- **`<leader>w/`**
  *Executes `:vsplit` to split the window vertically.*

- **`<leader>wd`**
  *Executes `:hide` to close (or hide) the current window pane.*

- **`<leader>dd`**
  *Duplicates the current line.*

- **`<leader>kk`**
  *Swaps the current line with the line above.*

- **`<leader>jj`**
  *Swaps the current line with the line below.*

---

## Spell Checking

- **`<leader>sc`**
  *Enables spell-checking with US English (`:set spell spelllang=en_us`).*

- **`<leader>sd`**
  *Disables spell-checking (`:set nospell`).*

---

## Function Keys & File Explorer

- **`<F1>` (Normal & Insert modes)**
  *Mapped to `<Esc>`, effectively disabling F1’s default behavior.*

- **`<C-n>` (Normal mode)** 
  *Toggles the file explorer with `:NvimTreeToggle`.*

---

## Commenting

- **`<leader>/` (Normal mode)** 
  *Toggle a comment on the current line.*

- **`<leader>/` (Visual mode)** 
  *Toggle comments on the selected lines.*


---

## LSP & Diagnostics

- **`<leader>e` (Normal mode)** 
  *Opens a floating diagnostic window using `vim.diagnostic.open_float`.*

- **`[d`**
  *Jumps to the previous diagnostic message.*

- **`]d`**
  *Jumps to the next diagnostic message.*

- **`<leader>q`**
  *Sets the location list with current diagnostics (`vim.diagnostic.setloclist`).*

---

## LSP Buffer-Local Mappings

- **`gD`**
  *Jumps to the declaration of the symbol under the cursor.*

- **`gd`**
  *Jumps to the definition of the symbol under the cursor.*

- **`K`**
  *Displays hover information for the symbol under the cursor.*

- **`gi`**
  *Jumps to the implementation of the symbol.*

- **`<C-k>`**
  *Displays signature help (function parameters, etc.).*

- **`<leader>wa`**
  *Adds a workspace folder via LSP.*

- **`<leader>wr`**
  *Removes a workspace folder via LSP.*

- **`<leader>wl`**
  *Lists the current workspace folders (printed to the command line).*

- **`<leader>r`**
  *Renames the symbol under the cursor.*

- **`<leader>a` (Normal & Visual modes)**
  *Opens the code actions menu for refactoring or quick fixes.*

- **`gr`**
  *Lists all references to the symbol under the cursor.*

- **`<leader>f`**
  *Formats the current buffer asynchronously using LSP.*

---

## Completion Menu (nvim-cmp) Mappings

- **`<Tab>` (Insert & Select modes)**
  *When the completion menu is visible, selects the next item; otherwise, it performs its default action.*

- **`<S-Tab>` (Insert & Select modes)** 
  *When the completion menu is visible, selects the previous item; otherwise, it performs its default action.*

---
