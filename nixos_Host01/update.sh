echo "Copy in /etc/nixos"
cp  configuration.nix /etc/nixos
cp  flake.nix /etc/nixos
cp  hardware-configuration.nix /etc/nixos
cp  home.nix /etc/nixos
cp  -r lang /etc/nixos
cp  -r software /etc/nixos
cp  -r env /etc/nixos
cp  -r hardware /etc/nixos

echo "Update System"
nix-channel --update
nix flake update
nixos-rebuild switch --show-trace
flatpak update