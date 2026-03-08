{ ... }:
{
  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Russell Weas";
        email = "russweas@gmail.com";
      };

      git = {
        auto-local-bookmark = true;
      };
    };
  };
}
