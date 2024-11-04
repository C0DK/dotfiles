# inspo: https://nixos.wiki/wiki/I3

{ config, pkgs, callPackage, ... }:

{
  programs.dconf.enable = true;
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
  services.xserver = {
    enable = true;

    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
      ]
      config = {
        modifier = "Mod4";
        gaps = {
          inner = 10;
          outer = 5;
        };
        };
    };
  };
}