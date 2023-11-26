{environment, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Suggestions from nvim:
set-option -sg escape-time 10
set-option -g focus-event on
set-option -sa terminal-overrides ',screen-256color:RGB'

# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf \; display 'Reloaded tmux config!'

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'M-h' if-shell "$is_vim" 'send-keys M-h' 'select-pane -L'
bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j' 'select-pane -D'
bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k' 'select-pane -U'
bind-key -n 'M-l' if-shell "$is_vim" 'send-keys M-l' 'select-pane -R'
tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\'  'select-pane -l'"
if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\\\'  'select-pane -l'"

bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R
bind-key -T copy-mode-vi 'C-\' select-pane -l
bind-key -T copy-mode-vi 'C-Space' select-pane -t:.+

# Don't rename windows automatically
set-option -g allow-rename off
    '';
  };
}
