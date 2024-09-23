#!/bin/bash

# バックアップファイルの保存先
BACKUP_DIR="./backups"
mkdir -p ${BACKUP_DIR}

# 現在の日付を取得
DATE=$(date +"%Y%m%d%H%M")

# バックアップファイル名
BACKUP_FILE="${BACKUP_DIR}/practice_db_backup_${DATE}.sql"

# Dockerコンテナ名
CONTAINER_NAME="mysql_practice_db"

# MySQLのユーザー情報
USER="user"
PASSWORD="password"
DATABASE="practice_db"

# バックアップ実行
docker exec ${CONTAINER_NAME} mysqldump -u${USER} -p${PASSWORD} ${DATABASE} > ${BACKUP_FILE}

echo "Backup completed: ${BACKUP_FILE}"
