{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  dbus,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "nono";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "always-further";
    repo = "nono";
    rev = "v${version}";
    hash = "sha256-32PiM84dwZ3dPIAIak1DL3iencguXCzehFCDsulDyhI=";
  };

  cargoHash = "sha256-nE0vVBThXnqo8VnFCkOyqhpZZ40MIkXSqUoJUZcDVhE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ dbus ];

  meta = with lib; {
    description = "OS-enforced capability sandbox for running untrusted AI agents";
    homepage = "https://nono.sh";
    license = licenses.asl20;
    mainProgram = "nono";
  };
}
