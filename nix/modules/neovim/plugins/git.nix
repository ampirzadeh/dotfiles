{ ... }:
{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        sign_priority = 100; # Place the status colors to the left
      };
    };
  };
}
