# Install all base packages, split by true provenance so nothing from the AUR
# installs without review:
#   omarchy-base.packages     -> official Arch repos (pacman)
#   omarchy-omarchy.packages  -> Omarchy's own [omarchy] packages (pacman)
#
# AUR packages (omarchy-aur.packages) are NOT installed here. The install runs
# non-interactively (stdin is /dev/null), so PKGBUILD review and the sudo
# prompt would fail or hang. They are installed on first login in a terminal,
# where each PKGBUILD is shown before building. See install/first-run/aur.sh.

read_list() {
  if [[ ! -f $1 ]]; then
    echo -e "\033[31mError: package list not found: $1\033[0m" >&2
    return 1
  fi
  grep -v '^#' "$1" | grep -v '^$'
}

mapfile -t arch_packages < <(read_list "$OMARCHY_INSTALL/omarchy-base.packages")
omarchy-pkg-add "${arch_packages[@]}"

mapfile -t omarchy_packages < <(read_list "$OMARCHY_INSTALL/omarchy-omarchy.packages")
omarchy-pkg-add "${omarchy_packages[@]}"
