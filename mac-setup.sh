#!/bin/bash

sudo gem install pivotal_git_scripts

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/opt/homebrew/bin/brew tap homebrew/cask-versions
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

/opt/homebrew/bin/brew upgrade
/opt/homebrew/bin/brew doctor

/opt/homebrew/bin/brew install --cask sublime-text \
				  pycharm-ce \
				  google-cloud-sdk \
				  webstorm \
                  postman \
				  docker \
				  google-chrome \
				  datagrip

/opt/homebrew/bin/brew install python \
			 git-lfs \
			 gradle \
			 mysql \
			 openssl \
			 node@14 \
			 jq \
			 parquet-tools \
			 leveldb \
			 r

sudo xcode-select --install

sudo softwareupdate --install-rosetta
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

sudo pip3 install --upgrade pip
sudo pip3 install --upgrade setuptools

echo "export LIBRARY_PATH=/usr/local/opt/openssl/lib/" >> ~/.zprofile
echo "export AIRFLOW_GPL_UNIDECODE=yes" >> ~/.zprofile
echo "export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true" >> ~/.zprofile

mkdir -p ~/.config
mkdir -p ~/.config/pip
cp ./pip.conf ~/.config/pip/
cp ./.pairs ~/.pairs

