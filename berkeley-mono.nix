{
  lib,
  requireFile,
  stdenvNoCC,
  unzip,
  variant ? "ligon-0variant1-7variant1",
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "berkeley-mono";
  version = "2.0";

  src = requireFile rec {
    name = "${finalAttrs.pname}-typeface-${variant}-${finalAttrs.version}.zip";
    sha256 = "17cqpql8zvakczvjhbzp6mgxvr137av2nik53p0ylk6gwjlqklv1";
    message = ''
      This file needs to be manually downloaded from Berkely Graphics
      site. An email will be sent to get a download link.

      Select the variant that matches & download the zip file.

      Then run:
      mv \$PWD/berkeley-mono-typeface.zip \$PWD/${name}
      nix-prefetch-url --type sha256 file://\$PWD/${name}
    '';
  };

  outputs = [ "out" "web" "variable" "variableweb" ];

  nativeBuildInputs = [
    unzip
  ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    runHook preInstall

    install -D -m444 -t $out/share/fonts/opentype berkeley-mono/OTF/*.otf
    install -D -m444 -t $out/share/fonts/truetype berkeley-mono/TTF/*.ttf
    install -D -m444 -t $web/share/fonts/webfonts berkeley-mono/WEB/*.woff2
    install -D -m444 -t $variable/share/fonts/truetype berkeley-mono-variable/TTF/*.ttf
    install -D -m444 -t $variableweb/share/fonts/truetype berkeley-mono-variable/WEB/*.woff2

    runHook postInstall
  '';

  meta = {
    description = "Berkely Mono Typeface";
    homepage = "https://berkeleygraphics.com/typefaces/berkeley-mono";
    license = lib.licenses.unfree;
    platforms = lib.platforms.all;
  };
})
