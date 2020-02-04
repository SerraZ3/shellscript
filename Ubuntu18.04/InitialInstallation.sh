echo "update"

sudo apt update
sudo apt install curl -y
sudo apt install snap -y
sudo apt-get install build-essential libssl-dev libffi-dev libgmp3-dev -y

echo -n "Instalar Google Chrome (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Google Chrome"
    echo "========================"

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

echo -n "Instalar Unrar(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Unrar"
    sudo apt-get install unrar -y


fi

echo -n "Instalar Deluge(torrent)(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Deluge(torrent)"
    sudo add-apt-repository ppa:deluge-team/ppa
    sudo apt install deluge -y

fi
echo -n "Instalar Visual Code (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Visual Code"

    sudo snap install code --classic

    sudo snap refresh code
fi

echo -n "Instalar Spotify (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    
    echo "Instalando Spotify"

    sudo snap install spotify
fi

echo -n "Instalar Telegram (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then

    echo "Instalando Telegram"

    sudo snap install telegram-desktop

    sudo snap install telegram-cli
fi

echo -n "Instalar Inkscape (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    
    echo "Instalando Inkscape"

    sudo apt  install inkscape
fi
echo -n "Instalar Z-shell (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Z-shell"
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

)
'
    echo 'Precione qualquer tecla para continuar'
    read aux

    nano .zshrc

    cd .oh-my-zsh/custom/plugins/

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/zsh-users/zsh-autosuggestions 

fi

echo -n "Instalar Nodejs versão 12.16 (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando NodeJs 12.16"

    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install nodejs -y
fi

echo -n "Instalar ReactJs (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando ReactJs"
    sudo npm install -g create-react-app
fi


echo -n "Instalar React Native (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Java"
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt-get update
    sudo apt-get install openjdk-8-jdk -y

    echo "Instalando Android Studio"
    sudo snap install android-studio --classic

    echo "Lembre-se de configurar o sdk no android studio"
    echo 'Precione qualquer tecla para continuar'
    read aux

    echo "Instalando ADB"
    sudo apt-get install adb -y

    echo "De baixar o platform-tools mais recente e por no /usr/lib/android-sdk"
    echo 'Precione qualquer tecla para continuar'
    read aux

    echo "Instalando o Watchman"
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


echo -n "Instalar Virtual Box(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Virtual Box"
    sudo apt update
    sudo apt upgrade

    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib"

    sudo apt update
    sudo apt install virtualbox-6.0 -y

fi

echo -n "Instalar AdonisJs(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Adonis"
    sudo npm i -g @adonisjs/cli

fi
echo -n "Instalar Apache(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Apache"
    sudo apt-get install apache2 -y
    sudo service apache2 status

fi

echo -n "Instalar PHP(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando PHP"
    sudo apt-get install php libapache2-mod-php php-mysql -y
    echo "Ponha o index.php na frente"
    echo 'Precione qualquer tecla para continuar'
    read aux
    sudo nano /etc/apache2/mods-enabled/dir.conf
    sudo systemctl restart apache2
fi


echo -n "Instalar Composer(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Composer"
    sudo curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    chmod +x /usr/local/bin/composer
    

fi

echo -n "Instalar Postman(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Postman"
    sudo apt install snapd snapd-xdg-open -y
    sudo snap install postman
    sudo snap switch --channel=candidate postman
    sudo snap refresh postman
fi

echo -n "Instalar VLC(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando VLC"
    sudo snap install vlc

fi

echo -n "Instalar Mysql Workbench(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Mysql Workbench"
    sudo apt update
    sudo apt install mysql-workbench -y

fi

echo -n "Instalar Postgres(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Postgres"
    sudo apt update
    sudo apt install postgresql postgresql-contrib

fi

echo -n "Instalar PgAdmin4(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando PgAdmin4"
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    sudo apt update
    sudo apt install pgadmin4 pgadmin4-apache2 -y
    echo "Para acessar acesse o localhost/pgadmin4"
fi



echo -n "Instalar PgModeler(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando PgModeler"

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


echo -n "Instalar Fonte Firacode(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Firacode"
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
        fi;
    done

    echo "fc-cache -f"
    fc-cache -f
fi

echo -n "Instalar Python 3(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Python 3"
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.7
    sudo apt install python3.7
fi

echo -n "Instalar Pycharm(y/n) via snap? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Pycharm"
    sudo apt update
    sudo snap install pycharm-community --classic
    sudo snap refresh pycharm-community --classic

fi

echo -n "Instalar Pip/Pip3(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Instalando Pip/Pip3"
    sudo apt update
    sudo apt install python3-pip
    sudo apt install python-pip
fi