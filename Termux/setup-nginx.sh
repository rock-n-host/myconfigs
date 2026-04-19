# Nginx setup script for Termux

# enable storage
termux-setup-storage

# install TUR and Nginx
pkg update && pkg upgrade -y &&  pkg install tur-repo -y
pkg install termux-services nginx -y
mkdir -p ~/services/

# create symlinks
ln -s $PREFIX/etc/nginx/ ~/services/nginx-config
ln -s $PREFIX/share/nginx/html/ ~/services/nginx-data
