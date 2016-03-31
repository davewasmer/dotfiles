# Setup

Clone the repo down and run the `bootstrap.sh` script. The script should be
idempotent, so re-run it anytime you'd like to sync the latest changes.

# Features

## `~/bin`

Automatically added to $PATH

## `~/.iterm2`

An iTerm2 configuration profile you can use in conjuction with the "load from
file option" found in the iTerm2 preferences

## Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```
