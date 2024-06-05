
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./homemanager.nix
      ./nushell.nix
      ./host.nix
      ./yubikey.nix
    ];

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.nushell;
  users.users.cabang = {
    isNormalUser = true;
    description = "Casper Weiss Bang";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];

  };


  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    # Install firefox.
    firefox.enable = true;

  };


  # disable all the default gnome apps
  services.gnome.core-utilities.enable = false;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
    signal-desktop
    spotify
    nordic

    yubikey-touch-detector
    yubikey-manager
    yubioath-flutter

    gnupg

    # The best terminal
    alacritty

    gimp

    killall

    # For GMeet and Chromecast
    chromium

    # terminal completor
    carapace 
    starship
  ];

  # TODOs:
  # - setup gnome shortcuts  https://discourse.nixos.org/t/nixos-options-to-configure-gnome-keyboard-shortcuts/7275
  # - Starship theme https://starship.rs/config/ 
}