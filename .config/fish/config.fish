if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="$HOME/.local/bin:$HOME/Documents/CP/scripts:$HOME/Documents/Software/7zip:$PATH"

alias bedtime='sudo systemctl hibernate'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias setbri='xrandr --output eDP-1 --brightness'
alias vie='ibus engine Bamboo::Us'
alias eng='ibus engine BambooUs::Flag'

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus

set fish_greeting
ibus engine BambooUs::Flag
xrandr --output eDP-1 --brightness (cat ~/.brightness)
