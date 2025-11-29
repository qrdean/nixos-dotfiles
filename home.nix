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
  };

  programs.git = {
    enable = true;
    extraConfig ={
      user.email = "dean.quinton@ymail.com";
      user.name = "quinton dean";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim";
    recursive = true;
  };

  home.packages = with pkgs; [
    neovim
    fzf
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    clang
    go

    # Language Servers
    lua-language-server
    gopls

    fastfetch
  ];

  # protonup steam compat tools
  # environment.sessionVariables = {
  #   STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
  #     "\${HOME}/.steam/root/compatibilitytools.d";
  # };
}
