{ ... }:
{
  services.gitea = {
    enable = true;
    database.type = "sqlite3";
    settings = {
      server = {
        HTTP_PORT = 3000;
        HTTP_ADDR = "0.0.0.0";
        DOMAIN = "localhost";
        ROOT_URL = "http://localhost:3000/";
      };
    };
  };
}
