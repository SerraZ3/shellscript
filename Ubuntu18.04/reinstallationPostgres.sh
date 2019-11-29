dpkg -l | grep postgres
sudo apt-get --purge remove postgresql-client-11 postgresql-client-common postgresql-common
sudo apt install postgresql postgresql-contrib
sudo -u postgres psql