{ pkgs, ... }:
{
  services.swaync = {
    enable = true;
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    font = {
      name = "Noto Sans";
      package = pkgs.nerd-fonts.noto;
    };
    theme = {
      name = "Juno-mirage";
      package = pkgs.juno-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
