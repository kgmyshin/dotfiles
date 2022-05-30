THIS_DIR=$(cd $(dirname $0); pwd)
pushd $THIS_DIR

echo "installing Homebrew ..."
type "brew" > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "run brew doctor ..."
brew doctor
echo "run brew update ..."
brew update
echo "ok. run brew upgrade ..."
brew upgrade
brew bundle
brew cleanup

popd