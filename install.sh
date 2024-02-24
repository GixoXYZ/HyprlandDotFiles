echo "Installing dotfiles..."
echo "Copying files to /home directory..."

cp .fonts.conf $HOME
cp -r .local $HOME
cp -r .config $HOME
cp -r Wallpapers $HOME/Pictures/

echo "Successfully copied files!"

echo "You can now reboot your system to see changes"
echo "Would you like to reboot now? (y/n)"

read reboot

if [ $reboot = "y" ]; then
    sudo reboot
else
    echo "Alright, you can reboot later by typing 'sudo reboot'"
fi
