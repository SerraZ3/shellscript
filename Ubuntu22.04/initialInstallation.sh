echo "update"

sudo apt update
sudo apt install curl -y
sudo apt install snap -y
sudo apt install snapd snapd-xdg-open -y
sudo apt-get install build-essential libssl-dev libffi-dev libgmp3-dev -y

echo -n "Google Chrome (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  echo "Installing..."
  echo "========================"

  curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/googlechrom-keyring.gpg

  sudo apt update

  sudo apt install -y google-chrome-stable
fi

echo -n "Instalar Unrar(y/n)? "
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

  sudo apt install software-properties-common apt-transport-https wget -y

  wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg

  echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list

  sudo apt update

  sudo apt install code


  # Ou
  # sudo snap install --classic code
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

  sudo apt install telegram-desktop -y

fi

echo -n "Inkscape (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then

  echo "Installing..."

  sudo apt install inkscape -y
fi

echo -n "Z-shell (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  echo "Installing..."
  echo "WARNING!"
  echo "After install restart the computer "

  sudo apt-get update -y

  sudo apt upgrade -y

  cd ~

  sudo apt install git-core zsh -y

  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  sudo apt install fonts-powerline -y

  echo 'Add in .zshrc'
  echo 'ZSH_THEME="agnoster"'
  echo 'and add'
  echo 'plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions

)'
  echo 'Please press any key'
  read aux

  nano .zshrc

  cd .oh-my-zsh/custom/plugins/

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  git clone https://github.com/zsh-users/zsh-autosuggestions

fi

echo -n "Postman(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  echo "Installing..."
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
      echo "Found existing file $sudo apt update
file_path"
    fi
  done

  echo "fc-cache -f"
  fc-cache -f
fi

echo -n "NVM(y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  echo "Installing..."
  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

  source ~/.profile
  source ~/.zshrc
fi

echo "instalando redis"
sudo apt install redis-server -y

echo "instalando mongo"
sudo apt install software-properties-common gnupg apt-transport-https ca-certificates -y
curl -fsSL https://pgp.mongodb.com/server-7.0.asc |  sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install mongodb-org -y


echo "Instalando mongo"
cd ~/Download
wget https://downloads.mongodb.com/compass/mongodb-compass_1.40.4_amd64.deb

sudo dpkg -i mongo*
