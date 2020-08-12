
{ config, pkgs, lib, ... }:
with rec {
  # Logo key. Use Mod1 for Alt. Use Mod4 for ⌘.
  modifier = "Mod1";
  terminal = "${pkgs.kitty}/bin/kitty";
  commands = rec {
    terminalDialog = "${terminal} --class dialog -o remember_window_size=no -o initial_window_height=540 --";
    menu = "${pkgs.wofi}/bin/wofi -iI -S drun,run";
    keyboardSwitcher = ''${terminalDialog} sh -c 'printf "0 us\n1 be" | ${pkgs.fzf}/bin/fzf | cut -d " " -f 1 | xargs ${pkgs.sway}/bin/swaymsg input type:keyboard xkb_switch_layout' '';
  };
};
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      menu = commands.menu;

      # Use Polybar instead
      bars = [];

      input = {
        "type:keyboard" = {
	  xkb_options = "ctrl:nocaps,altwin:swap_lalt_lwin";
	  xkb_layout = "us,be";
	  xkb_variant = ",";
	  xkb_numlock = "enabled";
	  xkb_capslock = "disabled";
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
        };

        # Laptop touch screen
        "1267:9767:ELAN0732:00_04F3:2627" = {
          map_to_output = "eDP-1";
        };
      };

      # Keybindings
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+s" = "exec ${commands.menu}";
        "${modifier}+Ctrl+k" = "exec ${commands.keyboardSwitcher}";

        # Media keys
        "XF86AudioRaiseVolume"  = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume"  = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute"         = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute"      = "exec ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        "XF86MonBrightnessUp"   = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
        "XF86AudioPlay"         = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext"         = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev"         = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "Pause"                 = "exec lock";
        "Shift+Pause"           = "exec systemctl suspend";
      };

      window.commands = [
        {
          criteria = { app_id = "dialog";};
          command = "floating enable, border pixel 10, sticky enable";
        }
      ];

      startup = [
        {
          command = ''
            ${pkgs.swayidle}/bin/swayidle -w \
              timeout 300  'lock &' \
              timeout 600  '${pkgs.sway}/bin/swaymsg "output * dpms off"; systemctl suspend'\
              resume       '${pkgs.sway}/bin/swaymsg "output * dpms on"' \
              before-sleep 'loginctl lock-session $XDG_SESSION_ID' \
              lock         '${pkgs.playerctl}/bin/playerctl -a pause && lock'

          '';
        }
      ];
    };
  };
}

