#/bin/bash

git --version
#check if git is correcly installed
if [ $? -ne 0 ]; then
  echo "installing git"
  apk add --update git
  if [ $? -eq 0 ]; then
    echo "installed git successfull"
  fi
fi

mkdir /home/dashboard
cd /home/dashboard
#clone repository
git clone https://github.com/amirrajan/nodejs-chat.git nodeSample
if [ $? -eq 0 ]; then
  echo "cloned repository"
fi
cd nodeSample
#check if node is installed correctly
node --version
if [ $? -ne 0]; then
  echo "bad stuff happend - node is not installed"
  rm -rf nodeSample
  exit
fi
#execute application
npm install
node server.js
