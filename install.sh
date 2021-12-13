clear
echo '[*] Preparing Neovim config directory....'
mkdir -p ~/.config/nvim
sleep 3
echo ''
echo "=========================="
echo "    Neovim Setting Up...  "
echo "=========================="
echo ''
echo '[*] Installing Neovim and its dependencies.'
echo '[*] Updating System....'
sudo pacman -Syu -y
echo '[*] System Up To Date!'
echo '[*] Installing Some Dependencies....'
sudo pacman -S neovim python3 python-pip python-virtualenv git curl ctags
python3 -m venv ~/.config/nvim/env
source ~/.config/nvim/env/bin/activate
pip install wheel
pip install yapf doq
deactivate
sudo pacman -S the_silver_searcher ripgrep bat
echo '[*] Dependency Installation Finished!'
echo ''
echo '[*] Downloading vim-plug....'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo '[*] vim-plug has been installed!'
echo ''
echo '[*] Backing up existing coc-settings.json....'
if [-f ~/.config/nvim/coc-settings.json ]; then
	cp ~/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json.backup
	echo '[*] coc-settings.json found! Backup complete!'
fi

echo '[*] Copying coc-settings.json -> ~/.config/nvim/coc-settings.json'
cp coc-settings.json ~/.config/nvim/

echo '[*] Backing up existing init.vim...'

if [-f ~/.config/nvim/init.vim ]; then
	cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
	echo '[*] init.vim has been found! Backup complete!'
fi

echo ''
echo '[*] Running :PlugInstall with nvim...'
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c 'PlugInstall' -c 'qa'
rm ~/.config/nvim/init.vim
echo ''
echo '[*] Finished running!'
echo ''
sleep 2
clear
echo '[*] Copying init.vim -> ~/.config/nvim/init.vim'
cp init.vim ~/.config/nvim/init.vim
sleep 1
echo ''
echo '[*] Installing fonts...'
curl -fLo ~/.fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf
echo ''
sleep 1
echo '[*] Font installation complete!'
sleep 1
echo ''
echo '======================='
echo '   Install Complete    '
echo '======================='
echo ''
