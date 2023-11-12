#!/usr/bin/env sh

echo
echo "Update the apt package index"
sudo apt-get -y update

echo
echo "Installing Git"
sudo apt -y install git

echo
echo "Connecting to Github via SSH"
echo "Verify if the SSH keys exists"
ls -al ~/.ssh

echo
echo "Check the list from the folder above to see if you already have SSH keys. By default, the SSH keys names are some of the following:
# id_rsa.pub
# id_ecdsa.pub
# id_ed25519.pub"

echo
echo "Do you need to configure the SSH key? (y/n)"
read able_continue;

while [ $able_continue == 'y' ];
do
email_correct='n';
	while [ $email_correct != 'y' ];
	do
	  echo
  	  echo "Enter your github e-mail:"
  	  read email;
	  git config --global user.email "$email"
  	  
	  echo
  echo "Your e-mail is $email. Is it right? (y/n)"
  	  read email_correct;
	  
  echo
  echo "What is your first name and last name?"
	  read name;
	  git config --global user.name "$name"
	done

	  echo
  	  echo "Creating a new SSH key, using the given e-mail. 
	  (Just press Enter to keep the default file name and choose a password.)"
  	  ssh-keygen -t ed25519 -C "$email"
	  
  echo
  	  echo "Adding your SSH key to the ssh-agent"
  	  echo "Starting ssh-agent in background"
  	  eval "$(ssh-agent -s)"

	  echo
  echo " Add your SSH private key to the ssh-agent"
  	  ssh-add ~/.ssh/id_ed25519

	  echo
  	  echo "Copying the content of the file id_rsa.pub to your clipboard"
  	  sudo apt-get install -y -f xclip
	xclip -sel clip < ~/.ssh/id_ed25519.pub

	  echo
  	  echo "Browse to https://github.com/settings/ssh/new > and paste with Ctrl+V on the field 'Key', choose a title and click on 'Add SSH key'."
  	  echo "DON'T USE CTRL+C ON ANYTHING, or you will lose the key in your clipboard and you will have to repeat the process."

	  echo
  	  echo "Do you need to repeat the process of adding the SSH key on github with the instruction above? (y/n)"
  	  read able_continue;
done
