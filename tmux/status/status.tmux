# This tmux statusbar config was created by tmuxline.vim
# on Fri, 18 Mar 2016

set -g status-bg "colour237"
set -g message-command-fg "colour237"
set -g status-justify "centre"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "colour109"
set -g message-bg "colour109"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "colour237"
set -g message-command-bg "colour109"
set -g status-attr "none"
# set -g status-utf8 "on"
set -g pane-border-fg "colour236"
set -g status-left-attr "none"
setw -g window-status-fg "colour109"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour237"
setw -g window-status-activity-attr "underscore"
setw -g window-status-activity-fg "colour109"
setw -g window-status-separator ""
setw -g window-status-bg "colour237"
set -g status-left "#[fg=colour237,bg=colour109] #S #[fg=colour109,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour109,bg=colour236] #H  #(whoami) #[fg=colour236,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour237] #{prefix_highlight} #[fg=colour237,bg=colour237,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour237,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour237] Online #{online_status} #[fg=colour236,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour109,bg=colour236] #{cpu_icon}#{cpu_percentage} #[fg=colour109,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour237,bg=colour109] #{battery_icon}#{battery_percentage} "
setw -g window-status-format "#[fg=colour237,bg=colour237,nobold,nounderscore,noitalics]#[default] #I  #W #[fg=colour237,bg=colour237,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour237,bg=colour109,nobold,nounderscore,noitalics]#[fg=colour237,bg=colour109] #I  #W #[fg=colour109,bg=colour237,nobold,nounderscore,noitalics]"
