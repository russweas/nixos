{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ## Jujutsu VCS
    jujutsu

    ## Jujutsu TUI
    jjui

    ## Editor
    helix

    ## LSP
    rust-analyzer
    pyright
    typescript-language-server
    gopls
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
      };
    };
    languages = {
      language-server.nil = {
        command = "nil";
        config.nil.formatting.command = [ "nixfmt" ];
      };
      language = [
        {
          name = "nix";
          formatter.command = "nixfmt";
          auto-format = true;
          language-servers = [ "nil" ];
        }
      ];
    };
  };
}
