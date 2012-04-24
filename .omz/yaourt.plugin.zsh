# Archlinux zsh aliases and functions for Yaourt
# Based on Pacman plugin

alias yaoupg='yaourt -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias yaoupa='yaourt -Syua'       # Synchronize with repositories before upgrading packages (including AUR) that are out of date on the local system.
alias yaoin='yaourt -S'           # Install specific package(s) from the repositories
alias yaoins='yaourt -U'          # Install specific package not from the repositories but from a file
alias yaore='yaourt -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias yaorem='yaourt -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias yaorep='yaourt -Si'              # Display information about a given package in the repositories
alias yaoreps='yaourt -Ss'             # Search for package(s) in the repositories
alias yaoloc='yaourt -Qi'              # Display information about a given package in the local database
alias yaolocs='yaourt -Qs'             # Search for package(s) in the local database
# Additional yaourt alias examples
if [[ -x `which abs` ]]; then
  alias yaoupd='yaourt -Sy && abs'     # Update and refresh the local package and ABS databases against repositories
else
  alias yaoupd='yaourt -Sy'     # Update and refresh the local package and ABS databases against repositories
fi
alias yaoinsd='yaourt -S --asdeps'        # Install given package(s) as dependencies of another package
alias yaomir='yaourt -Syy'                # Force refresh of all package lists after updating /etc/yaourt.d/mirrorlist

# https://bbs.archlinux.org/viewtopic.php?id=93683
paclist() {
  [[ -x $(which expac) ]] && expac "${fg[cyan]}%n${fg[green]}: ${reset_color}%d" || (
    yaourt -Qqei|awk 'BEGIN {FS=": "}/^Name/{printf("\033[36m%s\033[32m:\033[37m ", $2)}/^Description/{print $2}' && \
    echo "Please install expac! Awk used with yaourt -Qqei; expac is faster!" >&2
  )
}

pacdisowned() {
  tmp=${TMPDIR-/tmp}/yaourt-disowned-$UID-$$
  db=$tmp/db
  fs=$tmp/fs

  mkdir "$tmp"
  trap  'rm -rf "$tmp"' EXIT

  yaourt -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr \
      ! -name lost+found \
        \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"
}

asroot() {
  whence sudo &>/dev/null && sudo $@ || su -c "$@"
}

# yaourt() {
  yaourt_bin=${commands[yaourt-color]:-/usr/bin/yaourt}
#  case $1 in
#   -S | -S[^sihgl]* | -R* | -U*) asroot $yaourt_bin $@ ;;
#   *) $yaourt_bin "$@" ;;
#  esac
# }
