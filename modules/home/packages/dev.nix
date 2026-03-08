{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nil # nix

    ## AI
    claude-code

    ## formating
    nixfmt
    shfmt
    treefmt

    ## C / C++
    gcc
    gdb
    gef
    cmake
    gnumake
    valgrind
    clang-tools

    ## Python
    python3
    python312Packages.ipython
  ];
}
