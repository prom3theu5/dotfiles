#!/bin/bash

if ! command -v mas &>/dev/null; then
    echo "🔧 Installing Mac App Store CLI..."
    brew install mas
fi

if ! command -v fish &>/dev/null; then
    echo "🔧 Installing Fish Shell..."
    brew install fish
    echo "🔧 Adding Fish Shell to /etc/shells..."
    echo "$(which fish)" | sudo tee -a /etc/shells
    echo "🔧 Changing default shell to Fish..."
    chsh -s "$(which fish)"
fi

if ! command -v tv &>/dev/null; then
    echo "🔧 Installing Television CLI..."
    brew install televison
    tv update-channels
fi

chezmoi apply

