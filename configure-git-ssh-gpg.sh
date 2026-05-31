#!/usr/bin/env bash

echo
echo "Connecting to Github via SSH"

echo
echo "Update the apt package index"
sudo apt-get -y update

echo
echo "Installing Git"
sudo apt -y install git

email_correct='n';
while [ $email_correct == 'n' ];
do
	echo
	echo "What is your github e-mail?"
	read email;
	git config --global user.email "$email"
	
	echo
	echo "Your e-mail is $email. Is it right? (y/n)"
	read email_correct;
done

name_correct='n';
while [ $name_correct == 'n' ];
do
	echo
	echo "What is your first name and last name?"
	read name;
	git config --global user.name "$name"
	
	echo
	echo "Your name is $name. Is it right? (y/n)"
	read name_correct;
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
sudo apt-get install -y xclip
xclip -sel clip < ~/.ssh/id_ed25519.pub

echo
echo "Browse to"
echo
echo "> > > https://github.com/settings/ssh/new < < <"
echo 
echo "and paste with Ctrl+V on the field 'Key', choose a title and click on 'Add SSH key'."
echo "If you lose your clipboard content, you can copy the key again with the following command:"
echo
echo "xclip -sel clip < ~/.ssh/id_ed25519.pub"
echo

read -n 1 -s -r -p "After doing the instruction above, press any key to continue..."
echo
echo
echo "Beginning the GPG signing configuration"
echo "Source: https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key"
echo

gpg --default-new-key-algo rsa4096 --gen-key

echo
echo "Reading the long form of your GPG key ID"
gpg_key=$(gpg --list-secret-keys --with-colons 2>/dev/null | awk -F: '/^sec:/ {print $5}' | tail -n 1)

if [ -z "$gpg_key" ]; then
	echo "ERROR: No GPG secret key found. Did the key generation complete?" >&2
	echo "Re-run: gpg --default-new-key-algo rsa4096 --gen-key" >&2
	exit 1
fi

echo "Using GPG key: $gpg_key"

# Make sure Git uses the OpenPGP key (not an SSH key) for signing.
git config --global --unset gpg.format 2>/dev/null
git config --global user.signingkey "$gpg_key"
git config --global commit.gpgsign true
git config --global tag.gpgSign true

gpg --armor --export "$gpg_key" | xclip -sel clip

echo
echo "Browse to"
echo
echo "> > > https://github.com/settings/gpg/new < < <"
echo 
echo "and paste with Ctrl+V on the field 'Key', choose a title and click on 'Add GPG key'."
echo "If you lose your clipboard content, you can copy the key again with the following command:"
echo
echo "gpg --armor --export $gpg_key | xclip -sel clip"
echo

# Tell the shell about GPG so it can prompt for your passphrase (per GitHub docs).
[ -f ~/.bashrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bashrc
export GPG_TTY=$(tty)
