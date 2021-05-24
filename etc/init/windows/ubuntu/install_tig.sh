BASEPATH=$(basename $0)
TIMESTAMP=$(date +%Y%m%d%H%M%S)
TMPD=$(mktemp -dt "$BASEPATH.$TIMESTAMP.XXXXX")/
cd $TMPD
echo $(pwd)
git clone https://github.com/jonas/tig
cd tig
sudo apt-get install automake
sudo apt-get install libncursesw5-dev
./autogen.sh
./configure
make
sudo make install