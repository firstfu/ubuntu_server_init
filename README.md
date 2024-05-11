# Ubuntu 設定與 Docker 安裝腳本

這個倉庫包含一個名為 `init.sh` 的 shell 腳本，該腳本用於在 Ubuntu 系統上進行一些基本設定，並安裝 Docker 和 Docker Compose。

## 腳本功能

1. **Ubuntu 更新與配置**：這部分會更新 Ubuntu 的套件列表並升級所有已安裝的套件。然後，它會安裝一些常用的套件，如 `curl`、`wget`、`git`、`vim`、`net-tools`、`openssh-server`、`htop` 和 `fail2ban`。

2. **Docker 安裝**：這部分會安裝 Docker CE (Community Edition)。首先，它會安裝一些必要的工具以允許 apt 通過 HTTPS 使用存儲庫，然後添加 Docker 的官方 GPG 鑰匙，設定 Docker 存儲庫，並安裝 Docker CE。最後，它會檢查 Docker 是否已正確安裝。

3. **Docker Compose 安裝**：這部分會下載並安裝 Docker Compose 的最新版本，並賦予其可執行權限。最後，它會檢查 Docker Compose 是否已正確安裝。

## 使用方式

1. 克隆此倉庫到你的 Ubuntu 系統上：

```shellscript
git clone git@github.com:firstfu/ubuntu_server_init.git
```

2. 進入倉庫目錄：

```shellscript
cd ./ubuntu_server_init
```

3. 執行 `init.sh` 腳本：

```shellscript
./init.sh
```

請注意，你可能需要先給予 `init.sh` 可執行權限：

```shellscript
chmod +x init.sh
```

## 注意事項

- 請確保你的 Ubuntu 系統已經更新到最新版本。
- 請確保你的 Ubuntu 系統已經安裝了 `curl` 和 `git`。
- 請以 root 權限執行此腳本。