sudo mkdir /usr/local/dcdev
sudo chown -R runner:staff /usr/local/dcdev
cd /usr/local/dcdev
git clone https://github.com/psxdev/KallistiOS -b macport kos
cp ${GITHUB_WORKSPACE}/config/Makefile.cfg kos/utils/dc-chain
cd kos/utils/dc-chain
export CPATH=/opt/local/include
export LIBRARY_PATH=/opt/local/lib
make
make clean distclean
cd ../..
unset CPATH
unset LIBRARY_PATH
cp ${GITHUB_WORKSPACE}/config/environ.sh .
source /usr/local/dcdev/kos/environ.sh
make
cd ..
git clone https://github.com/psxdev/kos-ports -b macport
/usr/local/dcdev/kos-ports/utils/build-all.sh

 



