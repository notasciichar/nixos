#!usr/bin/fish

ssh -t nixos "sudo nixos-rebuild switch --flake github:notasciichar/nixos"
