# ##################################################
# Ubuntu更新與配置
# ##################################################
# 更新套件
sudo apt update -y && sudo apt upgrade -y
# 安裝常用套件
sudo apt install -y curl wget git vim net-tools htop
# 安裝中文字型
# sudo apt install -y fonts-wqy-zenhei fonts-wqy-microhei
# 安裝ssh server
sudo apt install openssh-server -y




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


# 獲取最新版本的Python3
latest_python=$(apt list | grep -oP '^python3\.\d+(?=/)' | sort -V | tail -1)

# 安裝最新版本的Python
sudo apt install "$latest_python" -y

# 顯示安裝的Python版本
$latest_python --version

# 輸出完成訊息
echo "python3最新版本安裝完成"


# ##################################################
#
# ##################################################