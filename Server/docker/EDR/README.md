EDR
===

## 環境配置
```bash
# Wazuh Manager
INDEXER_USERNAME=your_indexer_username
INDEXER_PASSWORD=your_indexer_password
API_USERNAME=your_api_username
API_PASSWORD=your_api_password

# Wazuh Dashboard
DASHBOARD_USERNAME=your_dashboard_username
DASHBOARD_PASSWORD=your_dashboard_password
```

## 注意部分
- Wazuh 索引器會建立許多虛擬記憶體區域(VMA),因此核心必須允許超過 Linux 預設限制65530。
    *  VMA 是一個記憶體區域,可讓像 Wazuh indexer 這樣的應用程式直接從磁碟存取檔案,就像在 RAM 中一樣。
        ```
        # sysctl -w vm.max_map_count=262144
        ```

## REF
- [Wazuh Docker deployment](https://documentation.wazuh.com/current/deployment-options/docker/wazuh-container.html)
- []()