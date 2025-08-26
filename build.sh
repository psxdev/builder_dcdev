sudo mkdir /usr/local/dcdev
sudo chown -R runner:staff /usr/local/dcdev
cd /usr/local/dcdev
git clone https://github.com/psxdev/KallistiOS -b macport kos
cp ${GITHUB_WORKSPACE}/config/Makefile.cfg kos/utils/dc-chain
cd kos/utils/dc-chain
make
make clean distclean
cd ../..
cp ${GITHUB_WORKSPACE}/config/environ.sh .
source /usr/local/dcdev/kos/environ.sh
make
cd ..
git clone https://github.com/psxdev/kos-ports
/usr/local/dcdev/kos-ports/utils/build-all.sh

 



