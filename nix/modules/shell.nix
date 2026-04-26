{ pkgs, ... }:
{
  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    theme = "One Half Dark";
    font-family = "FiraCode Nerd Font";
    font-size = 15;
    background-opacity = 0.75;
    gtk-titlebar = false;
  };

  programs.fish = {
    # Disable greeting
    interactiveShellInit = ''
      set fish_greeting
    '';
    enable = true;
    shellAbbrs = {
      s = "miniserve .";
      cat = "bat";
      ls = "eza --color=always --group-directories-first --icons";
      ll = "eza -la --icons --octal-permissions --group-directories-first";
      l = "eza -bGF --oneline --header --git --color=always --group-directories-first --icons";
      lt = "eza --tree --level=2 --color=always --group-directories-first --icons";
    };
    shellInit = "
    batman --export-env | source
    abbr -a --position anywhere -- --help '--help | bat -plhelp'
    abbr -a --position anywhere -- -h '-h | bat -plhelp'
    ";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      package.disabled = true;
      os.disabled = false;
    };
  };

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };

  programs.fzf = {
    enable = true;
  };

  programs.bat = {
    # TODO: do theme
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ];
  };

  programs.eza.enable = true;
  programs.eza.enableFishIntegration = false; # Disable default aliases
}
