OS="$(uname)"
if [[ "${OS}" == "Linux" ]]; then
  HOMEBREW_ON_LINUX=1
elif [[ "${OS}" != "Darwin" ]]; then
  abort "Homebrew is only supported on macOS and Linux."
fi
if [[ -z "${HOMEBREW_ON_LINUX-}" ]]; then
  UNAME_MACHINE="$(/usr/bin/uname -m)"
  if [[ "${UNAME_MACHINE}" == "arm64" ]]; then
    # On ARM macOS, this script installs to /opt/homebrew only
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    # On Intel macOS, this script installs to /usr/local only
    HOMEBREW_PREFIX="/usr/local"
  fi
else
  HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi

eval $(${HOMEBREW_PREFIX}/bin/brew shellenv)