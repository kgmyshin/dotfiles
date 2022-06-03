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

if ! (type "brew" > /dev/null 2>&1) ; then
  echo "installing Homebrew ..."
  type "brew" > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  eval $(${HOMEBREW_PREFIX}/bin/brew shellenv)
  echo "run brew doctor ..."
  brew doctor
  echo "run brew update ..."
  brew update
  echo "ok. run brew upgrade ..."
  brew upgrade
  brew bundle --global
  brew cleanup
fi

eval $(${HOMEBREW_PREFIX}/bin/brew shellenv)