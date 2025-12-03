{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.username = "qdean";
  home.homeDirectory = "/home/qdean";
  home.stateVersion = "25.05";

  programs.zsh = {
    enable = true;
    shellAliases = {
      hey = "echo hey there";
    };
    initContent = ''
      eval "$(starship init zsh)"
      '';
  };

  programs.git = {
    enable = true;
    settings ={
      user.email = "dean.quinton@ymail.com";
      user.name = "quinton dean";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 14;
      font-family = "Berkeley Mono";
      font-family-bold = "Berkeley Mono Bold";
      font-family-bold-italic = "Berkeley Mono Bold Italic";
      font-family-italic = "Berkeley Mono Italic";
    };
  };

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim";
    recursive = true;
  };

  home.packages = with pkgs; [
    # Programming
    neovim
    fzf
    ripgrep
    nixpkgs-fmt
    nodejs
    clang
    go

    # Language Servers
    nil
    lua-language-server
    gopls
    godot

    # cli
    fastfetch

    # Programs
    equibop
    xivlauncher

    # yubioath-flutter figure out pcscd
  ];
}
