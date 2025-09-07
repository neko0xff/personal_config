#!/bin/bash

# Database Connection Settings
PGHOST=${PGHOST:-app_db} 
PGPORT=${PGPORT:-5432}
PGUSER=${PGUSER:-admin}
PGDATABASE_1=${PGDATABASE_1:-mis_dev01}
PGDATABASE_1=${PGDATABASE_1:-mis_dev02}
export PGPASSWORD=${PGPASSWORD:-nekolab2025}

# Set backup directory and file name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR=${BACKUP_DIR:-/backups}
BACKUP_FILE_1="${BACKUP_DIR}/${PGDATABASE_1}_${TIMESTAMP}.sql"
BACKUP_FILE_2="${BACKUP_DIR}/${PGDATABASE_2}_${TIMESTAMP}.sql"

# Ensure backup directory exists
if [ ! -d "${BACKUP_DIR}" ]; then
  echo "[Error] Backup directory ${BACKUP_DIR} does not exist. Creating it now..."
  mkdir -p "${BACKUP_DIR}"
fi


# Backup DATABASE 1
echo "[Starting] PostgreSQL backup for ${PGDATABASE_1} to ${BACKUP_FILE_1}..."
if pg_dump -h "${PGHOST}" -p "${PGPORT}" -U "${PGUSER}" -d "${PGDATABASE_1}" > "${BACKUP_FILE_1}"; then
  echo "[${PGDATABASE_1}] Backup completed successfully!"
else
  echo "[Error] Backup for ${PGDATABASE_1} failed!"
  exit 1
fi

# Backup DATABASE 2
echo "[Starting] PostgreSQL backup for ${PGDATABASE_2} to ${BACKUP_FILE_2}..."
if pg_dump -h "${PGHOST}" -p "${PGPORT}" -U "${PGUSER}" -d "${PGDATABASE_2}" > "${BACKUP_FILE_2}"; then
  echo "[${PGDATABASE_2}] Backup completed successfully!"
else
  echo "[Error] Backup for ${PGDATABASE_2} failed!"
  exit 1
fi

# Compress backups
gzip "${BACKUP_FILE_1}"
echo "[Backup] file compressed to ${BACKUP_FILE_1}.gz"

gzip "${BACKUP_FILE_2}"
echo "[Backup] file compressed to ${BACKUP_FILE_2}.gz"

# Clean up old backup files (older than 7 days)
echo "[Cleaned] old backup files (>7 days)."
find "${BACKUP_DIR}" -type f -name "*.sql" -mtime +7 -delete


# Clear the PGPASSWORD variable for security
unset PGPASSWORD
