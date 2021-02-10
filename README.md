# gnup

## TL;DR
One command per line.\
The *magic variables* `__file` and `__path` are supported.\
Template tokens are formatted as `<token_name>` and can be reused.

![Example Usage](./example.gif)

## Install

```bash
git clone https://github.com/runarsf/gnup
cd gnup
sudo make install
```

## Dependencies
```
fzf
```

## Uninstall

```bash
sudo make uninstall
```

## *commands* file match detection (ordered by priority)

- Argument: `-f|--file <file>`
- Local: `./commands`
- Git: `commands` within a git repo
- Global: `~/.config/commands`
- Global: `~/.commands`
