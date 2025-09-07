--- PostgreSQL database initialization script

CREATE DATABASE mis_dev01;
CREATE DATABASE mis_dev02;

-- Handware Space
-- Config Source: https://pgtune.leopard.in.ua/
-- DB Version: 17
-- OS Type: linux
-- DB Type: web
-- Total Memory (RAM): 8 GB
-- CPUs num: 8
-- Connections num: 250
-- Data Storage: ssd

-- Autovacuum Setup
ALTER SYSTEM SET autovacuum_naptime = '1min';
ALTER SYSTEM SET autovacuum_vacuum_scale_factor = 0.2;

-- 效能與資源設定
ALTER SYSTEM SET max_connections = '250';
ALTER SYSTEM SET shared_buffers = '2GB';
ALTER SYSTEM SET effective_cache_size = '6GB';
ALTER SYSTEM SET maintenance_work_mem = '512MB';
ALTER SYSTEM SET work_mem = '8MB';
ALTER SYSTEM SET checkpoint_completion_target = '0.9';
ALTER SYSTEM SET wal_buffers = '16MB';
ALTER SYSTEM SET min_wal_size = '1GB';
ALTER SYSTEM SET max_wal_size = '4GB';

-- 查詢計劃與統計
ALTER SYSTEM SET default_statistics_target = '200';
ALTER SYSTEM SET random_page_cost = '1.5';  -- 若為高效能 SSD 可設為 1.1
ALTER SYSTEM SET effective_io_concurrency = '200';

-- 平行處理設定
ALTER SYSTEM SET max_worker_processes = '8';
ALTER SYSTEM SET max_parallel_workers_per_gather = '4';
ALTER SYSTEM SET max_parallel_workers = '8';
ALTER SYSTEM SET max_parallel_maintenance_workers = '4';

-- Huge Pages（視系統支援情況調整）
ALTER SYSTEM SET huge_pages = 'try';

-- 日誌與監控
ALTER SYSTEM SET log_min_duration_statement = '500ms';
ALTER SYSTEM SET log_checkpoints = 'on';
ALTER SYSTEM SET log_autovacuum_min_duration = '500ms';

-- 套用設定
SELECT pg_reload_conf();
