#!/bin/bash

# ##################################################
# Ubuntu更新與配置
# ##################################################
# 更新套件
sudo apt update -y && sudo apt upgrade -y
# 安裝常用套件
sudo apt install -y curl wget git vim net-tools openssh-server htop fail2ban
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev \
libreadline-dev libbz2-dev

# 安裝中文字型
# sudo apt install -y fonts-wqy-zenhei fonts-wqy-microhei



# ##################################################
# Docker安裝
# ##################################################
# 安裝一些必要的工具來允許 apt 通過 HTTPS 使用存儲庫
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# 添加 Docker 的官方 GPG 鑰匙
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 設定 Docker 存儲庫
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y

# 再次更新套件列表
sudo apt update -y

# 安裝 Docker CE (Community Edition)
apt-cache policy docker-ce -y
sudo apt install docker-ce -y

# 檢查 Docker 是否已正確安裝
sudo systemctl status docker --no-pager



# ##################################################
# Docker-Compose安裝
# ##################################################
# 下載 Docker Compose 的最新版本
sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 賦予可執行權限
sudo chmod +x /usr/local/bin/docker-compose
# 檢查安裝
docker-compose --version

# 輸出完成訊息
echo "Docker 和 Docker Compose 安裝完成"


# (可選)將當前用戶添加到 Docker 組，這樣你就不必在每次調用 Docker 命令時使用
# sudo usermod -aG docker ${USER}
# su - ${USER}


# ##################################################
# python3最新版本安裝
# ##################################################
# 添加Deadsnakes PPA
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update -y
# 获取最新版本的 Python3
LATEST_PYTHON=$(apt list | grep -oP '^python3\.\d+(?=/)' | sort -V | tail -1)
# 安装最新版本的 Python
sudo apt install -y $LATEST_PYTHON
# 显示安装的 Python 版本
$LATEST_PYTHON --version
# 输出完成信息
echo "Python3 最新版本安装完成"


# ##################################################
# 安裝nvm
# ##################################################
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 自动写入 nvm 初始化到 .bashrc 和 .zshrc
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc

echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc

# 自动加载配置更改
if [["$SHELL" == */bash ]]; then
    source ~/.bashrc
elif [[ "$SHELL" == */zsh ]]; then
    source ~/.zshrc
fi

echo "nvm 安装完成"




# ##################################################
# 安裝pyenv
# ##################################################
curl https://pyenv.run | bash
# 設定環境變數
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# 向 .bashrc 或 .zshrc 写入环境变量设置
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# 为 zsh 用户也进行设置，如果用户同时使用 bash 和 zsh
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc


# 自動加載 .bashrc 或 .zshrc，根據當前使用的 shell
if [[ "$SHELL" == */bash ]]; then
    source ~/.bashrc
elif [[ "$SHELL" == */zsh ]]; then
    source ~/.zshrc
fi

echo "pyenv 安装完成"


echo "系统初始化完成！"