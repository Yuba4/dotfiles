#!/bin/bash

set -e

echo "Homebrewのセットアップを開始..."

# Homebrewがインストールされているかチェック
if ! command -v brew &> /dev/null; then
    echo "Homebrewがインストールされていません。インストールを開始します..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrewは既にインストールされています"
fi

# Homebrewを最新にアップデート
echo "Homebrewをアップデート中..."
brew update

# Formulaのインストール
echo "Formulaをインストール中..."
formulas=(
    gh
    mise
)

for formula in "${formulas[@]}"; do
    if brew list --formula | grep -q "^${formula}$"; then
        echo "  ${formula} は既にインストールされています"
    else
        echo "  ${formula} をインストール中..."
        brew install "$formula" || echo "  ${formula} のインストールに失敗しました（スキップ）"
    fi
done

# Caskのインストール
echo "Caskをインストール中..."
casks=(
    1password
    alt-tab
    appcleaner
    aws-vault
    aws-vault-binary
    discord
    docker
    docker-desktop
    deck
    figma
    font-meslo-lg-nerd-font
    wezterm
    google-japanese-ime
    karabiner-elements
    postman
    spotify
    tableplus
    visual-studio-code
    wezterm
)

for cask in "${casks[@]}"; do
    if brew list --cask | grep -q "^${cask}$"; then
        echo "  ${cask} は既にインストールされています"
    else
        echo "  ${cask} をインストール中..."
        brew install --cask "$cask" || echo "  ${cask} のインストールに失敗しました（スキップ）"
    fi
done

echo "Homebrewのセットアップが完了しました！"
