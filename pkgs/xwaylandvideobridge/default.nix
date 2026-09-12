{
  lib,
  stdenv,
  fetchurl,
  cmake,
  extra-cmake-modules,
  pkg-config,
  qtbase,
  qtdeclarative,
  kcoreaddons,
  kcrash,
  kdbusaddons,
  ki18n,
  kpipewire,
  kstatusnotifieritem,
  kwindowsystem,
  libxcb,
  wrapQtAppsHook,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xwaylandvideobridge";
  version = "0.5.2";

  src = fetchurl {
    url = "mirror://kde/stable/xwaylandvideobridge/src/xwaylandvideobridge-${finalAttrs.version}.tar.xz";
    hash = "sha256-BSrQ0hhLTOESZ+Lvg9ggZMkg2dqbwDHHlzrzumpKKis=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase
    qtdeclarative
    kcoreaddons
    kcrash
    kdbusaddons
    ki18n
    kpipewire
    kstatusnotifieritem
    kwindowsystem
    libxcb
  ];

  meta = {
    description = "Utility to allow streaming Wayland windows to X applications";
    homepage = "https://invent.kde.org/system/xwaylandvideobridge";
    license = with lib.licenses; [
      bsd3
      cc0
      gpl2Plus
    ];
    maintainers = with lib.maintainers; [ stepbrobd ];
    platforms = lib.platforms.linux;
    mainProgram = "xwaylandvideobridge";
  };
})
