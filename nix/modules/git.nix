{ ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = "Amir Pirzadeh";
    settings.user.email = "am.pirzadeh@gmail.com";
    settings.init.defaultBranch = "main";
  };
}
