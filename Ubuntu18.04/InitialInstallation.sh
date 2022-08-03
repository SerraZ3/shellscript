echo "update"

sudo apt update
sudo apt install curl -y
sudo apt install snap -y
sudo apt-get install build-essential libssl-dev libffi-dev libgmp3-dev -y

echo -n "Google Chrome (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    echo "========================"

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

echo -n "Unrar(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt-get install unrar -y

fi

echo -n "Deluge(torrent)(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo add-apt-repository ppa:deluge-team/ppa
    sudo apt install deluge -y

fi
echo -n "Visual Code (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."

    sudo snap install code --classic

    sudo snap refresh code
fi

echo -n "Spotify (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then

    echo "Installing..."

    sudo snap install spotify
fi

echo -n "Telegram (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then

    echo "Installing..."

    sudo snap install telegram-desktop

    sudo snap install telegram-cli
fi

echo -n "Inkscape (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then

    echo "Installing..."

    sudo apt install inkscape
fi

echo -n "Z-shell (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    echo "Atenção!"
    echo "Após a instalação reiniciar o computador"

    sudo apt-get update -y

    sudo apt upgrade -y

    cd ~

    sudo apt install git-core zsh -y

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    sudo apt install fonts-powerline -y

    echo 'Adicione no .zshrc'
    echo 'ZSH_THEME="agnoster"'
    echo 'Adicione tambem'
    echo 'plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions

)'
    echo 'Precione qualquer tecla para continuar'
    read aux

    nano .zshrc

    cd .oh-my-zsh/custom/plugins/

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/zsh-users/zsh-autosuggestions

fi

echo -n "Nodejs versão 12.16 (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."

    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install nodejs -y
fi

echo -n "ReactJs (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo npm install -g create-react-app
fi

echo -n "React Native (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt-get update
    sudo apt-get install openjdk-8-jdk -y

    echo "Installing..."
    sudo snap install android-studio --classic

    echo "Lembre-se de configurar o sdk no android studio"
    echo 'Precione qualquer tecla para continuar'
    read aux

    echo "Installing..."
    sudo apt-get install adb -y

    echo "De baixar o platform-tools mais recente e por no /usr/lib/android-sdk"
    echo 'Precione qualquer tecla para continuar'
    read aux

    echo "Installing..."
    cd ~
    git clone https://github.com/facebook/watchman.git
    cd watchman/
    git checkout v4.9.0
    sudo apt-get install -y autoconf automake build-essential python-dev -y
    sudo apt-get install libtool -y
    sudo apt-get install libssl-dev -y
    sudo apt install pkg-config -y
    ./autogen.sh
    ./configure
    make
    sudo make install
    watchman --version

    sudo npm install -g react-native-cli
fi

echo -n "Virtual Box(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt update
    sudo apt upgrade

    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib"

    sudo apt update
    sudo apt install virtualbox-6.0 -y

fi

echo -n "AdonisJs(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo npm i -g @adonisjs/cli

fi
echo -n "Apache(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt-get install apache2 -y
    sudo service apache2 status

fi

echo -n "PHP(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt-get install php libapache2-mod-php php-mysql -y
    echo "Ponha o index.php na frente"
    echo 'Precione qualquer tecla para continuar'
    read aux
    sudo nano /etc/apache2/mods-enabled/dir.conf
    sudo systemctl restart apache2
fi

echo -n "Composer(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    chmod +x /usr/local/bin/composer

fi

echo -n "Postman(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt install snapd snapd-xdg-open -y
    sudo snap install postman
    sudo snap switch --channel=candidate postman
    sudo snap refresh postman
fi

echo -n "VLC(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo snap install vlc

fi

echo -n "Mysql Workbench(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt update
    sudo apt install mysql-workbench -y

fi

echo -n "Postgres(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt update
    sudo apt install postgresql postgresql-contrib

fi

echo -n "PgAdmin4(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    sudo apt update
    sudo apt install pgadmin4 pgadmin4-apache2 -y
    echo "Para acessar acesse o localhost/pgadmin4"
fi

echo -n "PgModeler(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."

    sudo apt install build-essential -y
    sudo apt install qtcreator -y
    sudo apt install qt5-default -y
    qmake -version

    sudo apt-get install libxml2 libxml2-dev -y
    sudo apt-get install libpq-dev libpq5 -y
    pkg-config libpq --cflags --libs

    sudo apt-get install pgmodeler -y
    echo "Para roda rode no terminal 'pgmodeler'"
fi

echo -n "Fonte Firacode(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    fonts_dir="${HOME}/.local/share/fonts"
    if [ ! -d "${fonts_dir}" ]; then
        echo "mkdir -p $fonts_dir"
        mkdir -p "${fonts_dir}"
    else
        echo "Found fonts dir $fonts_dir"
    fi

    for type in Bold Light Medium Regular Retina; do
        file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
        file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
        if [ ! -e "${file_path}" ]; then
            echo "wget -O $file_path $file_url"
            wget -O "${file_path}" "${file_url}"
        else
            echo "Found existing file $file_path"
        fi
    done

    echo "fc-cache -f"
    fc-cache -f
fi

echo -n "Python 3(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.7
    sudo apt install python3.7
fi

echo -n "Pycharm(y/n) via snap? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt update
    sudo snap install pycharm-community --classic
    sudo snap refresh pycharm-community --classic

fi

echo -n "Pip/Pip3(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "Installing..."
    sudo apt update
    sudo apt install python3-pip
    sudo apt install python-pip
fi
