#!/usr/bin/env bash

# Exit on error
set -e

echo "Starting system setup..."

# Function to check if a command was successful
check_status() {
    if [ $? -eq 0 ]; then
        echo "✓ $1 completed successfully"
    else
        echo "✗ Error during $1"
        exit 1
    fi
}

# Install system packages
echo "Installing required packages..."
sudo pacman -S --needed \
    starship \
    eza \
    zoxide \
    zsh \
    xdman-beta-bin \
    brightnessctl \
    google-chrome \
    visual-studio-code-bin \
    slack-desktop \
    bat \
    fd \
    lsd \
    ripgrep \
    fzf \
    nvm \
    github-cli \
    git \
    neovim \
    npm \
    redshift \
    nitrogen 

check_status "Package installation"

sudo pacman -R firefox sofirem-git
    
check_status "Package removal"

paru cursor-bin

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    check_status "Oh My Zsh installation"
else
    echo "Oh My Zsh is already installed"
fi

# Set up Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
echo "Installing Zsh plugins..."

# Function to install plugin
install_plugin() {
    local repo=$1
    local plugin_name=$2
    local install_path="$ZSH_CUSTOM/plugins/$plugin_name"

    if [ ! -d "$install_path" ]; then
        git clone --depth 1 "https://github.com/$repo" "$install_path"
        check_status "$plugin_name installation"
    else
        echo "$plugin_name is already installed"
    fi
}

# Install plugins
install_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions"
install_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting"
install_plugin "zdharma-continuum/fast-syntax-highlighting" "fast-syntax-highlighting"
install_plugin "marlonrichert/zsh-autocomplete" "zsh-autocomplete"

# Change default shell to Zsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing default shell to Zsh..."
    chsh -s /usr/bin/zsh
    check_status "Shell change"
else
    echo "Zsh is already the default shell"
fi

echo "Setup completed successfully! Please restart your terminal."

