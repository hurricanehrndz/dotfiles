{ stdenv, fetchFromGitHub, rustPlatform, pkgconfig, openssl, darwin }:

rustPlatform.buildRustPackage rec {
  pname = "sheldon";
  version = "unstable-2020-12-19";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "rossmacarthur";
    repo = pname;
    rev = "eb871fee9f791d5a5f33cbbd1e4b8a60769ea65b";
    sha256 = "sha256-3yuOgc0S7zAgdpBwS+Ajy2/PH0/v01/N2eDWpKlwNqc=";
  };

  cargoSha256 = "sha256-JcqfHNkpUD34pAeN+W5tbRr7dectrJ7zGbq9ThbN+uM=";

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ openssl ]
  ++ stdenv.lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with stdenv.lib; {
    description = "Fast, configurable, shell plugin manager ";
    homepage = https://github.com/rossmacarthur/sheldon;
    license = with licenses; [ asl20 /* or */ mit ];
    platforms = platforms.all;
    maintainers = [ maintainers.hurricanehrndz ];
  };
}
