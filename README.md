# tab-manager.yazi

A simple [Yazi](https://github.com/sxyazi/yazi) plugin using [fzf](https://github.com/junegunn/fzf) to switch tabs.

## Installation

```sh
# Linux/macOS
git clone https://github.com/h-hg/tab-manager.yazi.git ~/.config/yazi/plugins/tab-manager.yazi

# Windows
git clone https://github.com/h-hg/tab-manager.yazi.git $env:APPDATA\yazi\config\plugins\tab-manager.yazi
```

## Usage

You can configure the keymap as shown below.

```toml
# other CLI
[[manager.prepend_keymap]]
on   = [ "t", "s" ]
run  = "plugin tab-manager"
desc = "Show tab manager"
```
