# Polybar configuration
I'm using `bspwm` so I use `internal/bspwm` module, you can change it to your WM/DE.

- Install necessary fonts:
    - `ttf-font-awesome` AUR
    - [powerline](https://github.com/powerline/powerline)
    - (I learn Japanese) `ttf-kanjistrokeorders` AUR 
- I use `stalonetray` for system tray (the rightmost arrow on the bar).
- At `[module/network]`, change `interface = ...` to your preferred interface, mine is `wlan0`.
- At `[module/battery]`, change `battery = ...` to your battery name.
