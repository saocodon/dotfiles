# Installing `dunst`
```shell
sudo pacman -S dunst notification-daemon libnotify
```
Follow instructions [here](https://wiki.archlinux.org/title/Desktop_notifications#Standalone) to configure `notification-daemon`.

To start `dunst`, use `sleep 1s && dunst &`. I use `dunst` for some critical notifications (e.g. low battery `~/.batwarn.sh`).
