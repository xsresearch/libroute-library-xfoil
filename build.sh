set -e

# Download and install compiler tools
apt-get update
apt-get install -y gcc gfortran make libX11-dev

chown user:user /home/user/xfoil6.97_patch.txt
su user

# Download xfoil
cd /home/user
wget http://web.mit.edu/drela/Public/web/xfoil/xfoil6.97.tar.gz
echo "f91ee2ee24367ffb77b836684b999691f83cc1b4  xfoil6.97.tar.gz" | sha1sum --check

tar xvf xfoil6.97.tar.gz
cd Xfoil
patch -p 1 -i ../xfoil6.97_patch.txt
cd bin
make

# Install component library
gem install libroute-component

cp /home/user/Xfoil/bin/xfoil /usr/local/bin/xfoil

cd /home/user
rm -r -f Xfoil
rm -f xfoil6.97_patch.txt
rm -f xfoil6.97.tar.gz
