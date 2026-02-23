### Installation Instructions

To update run: nix flake update
Then if using berkeley mono run: nix-prefetch-url --type sha256 file://$PWD/berkeley-mono-typeface-ligon-0variant1-7variant1-2.0.zip
To rebuild: sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos

