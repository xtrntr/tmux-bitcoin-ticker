# Tmux bitcoin ticker

Tmux plugin that enables displaying bitcoin price for your workstation. Corruption galore!

Tested and working on OSX.

### Usage

Add the following to your `.tmux.conf`
```
set -g status-right "#{btc_price} | %H:%M:%S"
```

Update your status-interval if you want faster updates.
There may be rate limit caps that the exchanges place on their APIs.
```
set -g status-interval 5
```

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in .tmux.conf:

```
set -g @plugin 'tmux-plugins/tmux-online-status'
```
Hit prefix + I to fetch the plugin and source it.

```
#{online_status} interpolation should now work.
```

### Manual Installation

Clone the repo:

```
$ git clone https://github.com/xtrntr/tmux-bitcoin-ticker ~/clone/path
```

Add this line to the bottom of `.tmux.conf`:

```
run-shell ~/clone/path/bitcoin_ticker.tmux
```

Reload TMUX environment:

```
# type this in terminal
$ tmux source-file ~/.tmux.conf
```

### License

[MIT](LICENSE.md)
