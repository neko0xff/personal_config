資料庫
===

## 服務

- PostgresSQL
  * Version: 17
  * use images: `postgres:17.0-alpine`
  * Port: `5435:5432`
  * 功能
    1. Database
    2. 自動備份
  * 相關配置
    * Linux(`linux`)
      1. 資料庫本體: `/usr/local/swt_erp_db_pgsql_17/data`
      2. 備份檔案:  `/usr/local/swt_erp_db_pgsql_17/backup`
    * Windows(`win`)
      1. 資料庫本體: `swt_erp_db_pgsql_17_data`
      2. 備份檔案:  `swt_erp_db_pgsql_17_backup`

## 如何啟用

- Windows
  ```powershell
   PS C:\Users\SWT\git\swt_erp_service\service\database\win> docker compose up --build -d 
  ```
- Linux/macOS
  * 本目錄下,有`Makefile`建置腳本
    ```
    $ make
    ```

## 環境配置
```
POSTGRES_USER=your_database_username
POSTGRES_PASSWORD=your_database_password
```

## FAQ
### Q1 如何檢視容器內是否有自動排程
- A1: 請使用 `crontab`
    ```shell
    / # crontab -l
    # This file contains cron jobs for database backups
    # Backup job to run daily at 19:00
    # Ensure the script is executable and logs output to cron.log
    
    0 19 * * * /usr/local/bin/backup.sh >> /var/log/cron.log 2>&1/ 
    ```