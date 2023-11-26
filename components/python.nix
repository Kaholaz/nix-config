{environment, pkgs, ...}:
let myPythonPackages = ps: with ps; [
    black
    matplotlib
    numpy
    scipy
];
in
{
  environment.systemPackages = with pkgs; with python3Packages; [
    (python3.withPackages myPythonPackages)
    ruff
  ];
}
