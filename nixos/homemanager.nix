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

    programs = {
      git = {
        enable = true;
        userEmail = "c@cwb.dk";
        userName = "Casper Weiss Bang";
        signing = {
          key = "2E1DC0FF50920EDDDE1757D9881239F715822BB7";
        };
        aliases = {
          co = "checkout";
          aa = "add -A";
          cob = "checkout -b";
          br = "branch";
          pl = "pull";
          ps = "push";
          psf = "push --force";
          aacmp = "!f() { git add -A && git commit -m \"$@\" && git push; }; f";
          cp = "cherry-pick";
          back = "checkout -";
	        amend = "commit --amend --no-edit";
          aamend = "!git aa && git amend";
        };
        includes = [
          # TODO can we import this better?
          { path = "~/Documents/dotfiles/gitconfig/gitconfig"; }
        ];
      };

      alacritty = {
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
      vscode = {
        enable = true;
        package = pkgs.vscodium;

        mutableExtensionsDir = false;
        userSettings = {
          "workbench.colorTheme"= "Nord";
          "files.autoSave"= "afterDelay";
          "editor.fontFamily"= "'FuraCode Nerd Font Mono', 'FiraCode Nerd Font Mono', 'Fira Code'";
          "editor.fontLigatures"= true;
          "security.workspace.trust.untrustedFiles"= "open";
          "vim.vimrc.enable"= false;
          "editor.formatOnSave"= true;
        };

        extensions = with pkgs.vscode-extensions; [
          bbenoist.nix
          arcticicestudio.nord-visual-studio-code
          ms-python.python
          vscodevim.vim
          yzhang.markdown-all-in-one
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "toml";
            publisher = "be5invis";
            version = "0.6.0";
            sha256 = "yk7buEyQIw6aiUizAm+sgalWxUibIuP9crhyBaOjC2E=";
          }
          {
            name = "trailing-spaces";
            publisher = "shardulm94";
            version = "0.3.1";
            sha256 = "0h30zmg5rq7cv7kjdr5yzqkkc1bs20d72yz9rjqag32gwf46s8b8";
          }
          {
            name = "vscode-docker";
            publisher = "ms-azuretools";
            version = "1.18.0";
            sha256 = "UPUfTOc5xJhI5ACm2oyWqtZ4zNxZjy16D6Mf30eHFEI=";
          }
          {
            name = "shift-shift";
            publisher = "ahgood";
            version = "0.0.5";
            sha256 = "r6qzsQTQrTbZiloFdyH5XtT2P2Mf3uOV70iCNuJa6HQ=";
          }
        ];
      };

      vim = {
        enable = true;
        defaultEditor = true;
        plugins = with pkgs.vimPlugins; [
          vim-airline
          vim-misc
          vim-markdown
          tabular
          nord-vim
        ];
        settings = {
          ignorecase = true;
          number = true;
          tabstop = 4;

        };
        extraConfig = ''
          set t_Co=16
          set clipboard=unnamedplus
        '';
      };
    };
  };

}
