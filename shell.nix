let pkgs = import <nixpkgs> {};

in pkgs.mkShell rec {
  name = "neverthrow";

  buildInputs = with pkgs; [
    nodejs_22
    dos2unix
  ];
}
