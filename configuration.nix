{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nihal = {
    isNormalUser = true;
    description = "nihal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
openssh.authorizedKeys.keys = [
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILf2Rk2zBDt59KMamn3hFdyQwSu+hLy3yqwotpqZ5sDa nixos"
];
  };

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  services.openssh.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
   networking.firewall.allowedTCPPorts = [ 3030 ];
  networking.firewall.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}
