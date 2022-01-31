#!/bin/bash

function install_deps {
  sudo apt-get install \
    vim \
    neovim \
    git \
    tmux \
    cmake \
    g++ \
    clang-format \
    wmctrl \
    ripgrep \
    fzf \
    zsh \
    sqlite3 \
    xsel \
    imwheel \
    silversearcher-ag \
    terminator
}

function install_vundle {
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function install_zsh_stuff {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/larkery/zsh-histdb $HOME/.oh-my-zsh/custom/plugins/zsh-histdb
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

}

function make_dirs {
  mkdir bin
  mkdir git
}

function install_env {
  cd git

  git clone https://github.com/mjohns/env.git
  cp env/config/.tmux.conf ~
  cp env/config/.vimrc ~
  cp env/config/.inputrc ~
  cp env/config/.bashrc ~
  cp env/config/.zshrc ~
  cp env/config/.clang-format ~
  cp env/config/.xbindkeysrc ~
  cp env/config/.imwheelrc ~

  cp env/bin/tgo ~/bin
  cp env/bin/gls ~/bin
  cp env/bin/i ~/bin
  cp env/bin/all ~/bin
  cp env/bin/sort_ag.py ~/bin
  cp env/bin/fa ~/bin

  mkdir -p ~/.config/terminator
  cp env/config/terminator_config ~/.config/terminator/config

  cd ~
}

cd ~
