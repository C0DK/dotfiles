

{ config, pkgs, ... }:

{

  networking.hostName = "canix"; # Define your hostname.
  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "winkeys";
  };

  # Configure console keymap
  console.keyMap = "dk-latin1";

  virtualisation.docker.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

}