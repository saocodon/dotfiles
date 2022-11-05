# Polybar configuration
I'm using `i3-gaps` so I use `internal/i3` module, you can change it to your WM or DE.

- Install necessary fonts:
    ```shell
    yay -S ttf-liberation ttf-font-awesome noto-fonts-emoji nerd-fonts-meslo
    ```
    Make sure `yay` is installed before running the above command.
- At `[module/network]`, change `interface = ....` to your preferred interface, mine is `wlan0`.
- At `[module/battery]`, change `battery = ...` to your battery name.
