{
  lib,
  fetchurl,
  stdenv,
  zlib,
  autoPatchelfHook,
  alsa-lib,
  libGL,
  libpulseaudio,
  xorg,
}:

stdenv.mkDerivation {
  pname = "usagi";
  version = "1.3.1";
  src = fetchurl {
    url = "https://codeberg.org/brettchalupa/usagi/releases/download/v1.3.1/usagi-1.3.1-linux-x86_64.tar.gz";
    sha256 = "913e6ebc32cfe55be140e7558cb66fa2a9eeaaf08328eafc90acaae9d8dae62b";
  };

  nativeBuildInputs = [autoPatchelfHook];
  buildInputs = [zlib stdenv.cc.cc.lib];

  sourceRoot = ".";
  installPhase = ''
    runHook preInstall
    install -Dm755 usagi $out/bin/usagi 
    runHook postInstall
  '';

  runtimeDependencies = [
    libGL
    alsa-lib
    libpulseaudio
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXrender
    xorg.libXxf86vm
    xorg.libxcb
  ];

  meta = with lib; {
    description = "Simple 2D game engine for rapid prototyping with Lua, featuring live reload and cross-platform export";
    license = licenses.unlicense;
    mainProgram = "usagi";
    platforms = ["x86_64-linux"];
  };
}
