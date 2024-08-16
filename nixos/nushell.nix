# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    home-manager.users.cabang.programs = {
        nushell = {
            enable = true;
            # for editing directly to config.nu
            extraConfig = ''
            let carapace_completer = {|spans|
                carapace $spans.0 nushell $spans | from json
            }
            $env.config = {
                show_banner: false,
                completions: {
                case_sensitive: false # case-sensitive completions
                quick: true    # set to false to prevent auto-selecting completions
                partial: true    # set to false to prevent partial filling of the prompt
                algorithm: "fuzzy"    # prefix or fuzzy
                external: {
                # set to false to prevent nushell looking into $env.PATH to find more suggestions
                    enable: true
                # set to lower can improve completion performance at the cost of omitting some options
                    max_results: 100
                    completer: $carapace_completer # check 'carapace_completer'
                }
                }
            }
            $env.PATH = ($env.PATH |
                split row (char esep) |
                append /usr/bin/env
            )

            $env.SSH_AUTH_SOCK = (gpgconf --list-dirs agent-ssh-socket)
            '';
            shellAliases = {
                nixup = "sudo nixos-rebuild switch";
                nixchanup ="sudo nix-channel --update";
                nixupgrade = "sudo nixos-rebuild switch --upgrade";
                code = "codium";
            };
        };
        carapace.enable = true;
        carapace.enableNushellIntegration = true;

        starship = { enable = true;
            settings = {
                add_newline = true;
                character = {
                success_symbol = "[➜](bold green)";
                error_symbol = "[➜](bold red)";
            };
            };
        };
    };
}
