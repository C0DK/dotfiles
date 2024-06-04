{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.cabang = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.11";

    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.8;
          decorations = "full";
          dynamic_title = true;
        };
        colors = {
          primary = {
            background = "0x2E3440";
            foreground= "0xD8DEE9";
          };
          cursor = {
            text= "0x2E3440";
            cursor= "0xD8DEE9";
          };
          normal = {
            black= "0x3B4252";
            red= "0xBF616A";
            green= "0xA3BE8C";
            yellow= "0xEBCB8B";
            blue= "0x81A1C1";
            magenta= "0xB48EAD";
            cyan= "0x88C0D0";
            white= "0xE5E9F0";
          };
          bright = {
            black= "0x4C566A";
            red= "0xBF616A";
            green= "0xA3BE8C";
            yellow= "0xEBCB8B";
            blue= "0x81A1C1";
            magenta= "0xB48EAD";
            cyan= "0x8FBCBB";
            white = "0xECEFF4";
          };
        };
      };
    };
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    
    /*dconf = {
      enable = true;
      settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };*/
  };

}
