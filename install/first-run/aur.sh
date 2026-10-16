# Install the default AUR packages on first login, in a terminal, so the user
# can review each PKGBUILD before it is built. The main install runs
# non-interactively and cannot do this.

[[ -x $OMARCHY_PATH/bin/omarchy-install-default-aur ]] || exit 0

# Give the graphical session a moment to settle before opening a terminal.
sleep 5

omarchy-launch-floating-terminal-with-presentation "omarchy-install-default-aur"
