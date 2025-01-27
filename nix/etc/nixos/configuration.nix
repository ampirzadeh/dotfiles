{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "192.168.1.200" "8.8.8.8" "1.1.1.1" ];

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.users.amir = {
    isNormalUser = true;
    description = "amir";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    bat
    bat-extras.batman
    cargo
    clipse
    feh
    ffmpeg
    fzf
    gh
    ghostty
    go
    hypridle
    hyprpaper
    hyprpolkitagent
    hyprshot
    nautilus
    nodePackages_latest.nodejs
    nwg-look
    pavucontrol
    ripgrep
    rofi-wayland
    stow
    swaynotificationcenter
    vlc
    wget
    wl-clip-persist
    wl-clipboard
    zig
    zoxide
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    font-awesome
  ];

  system.stateVersion = "24.11"; # DON'T CHANGE THIS BEFORE READING THE DOCUMENTATION ON IT

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.waybar.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  programs.neovim.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "ssh" ];
      theme = "robbyrussell";
    };
  };
  programs.yazi.enable = true;
}
