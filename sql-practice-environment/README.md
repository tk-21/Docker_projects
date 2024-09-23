# SQL Practice Environment

## 概要

このプロジェクトは、MySQLを使用したSQLの練習環境を提供します。Docker Composeを使用して、MySQLデータベースとphpMyAdminを簡単にセットアップできます。サンプルデータベースを使用して、さまざまなSQLクエリを実行し、効率的にSQLを学習できます。

## ディレクトリ構成

sql-practice-environment/
├── docker-compose.yml
├── init.sql
├── README.md
├── data/
│   └── mysql/
├── phpmyadmin/
│   └── config.user.inc.php (必要に応じて)
├── scripts/
│   └── backup.sh
├── queries/
│   ├── basic_queries.sql
│   ├── aggregation_queries.sql
│   ├── complex_queries.sql
│   └── window_functions.sql
└── .gitignore


## セットアップ手順

1. **リポジトリのクローン**

   git clone https://github.com/yourusername/sql-practice-environment.git
   cd sql-practice-environment



### 4. その他のファイル

#### `data/mysql/`

- **役割**: MySQLのデータ永続化用ディレクトリ。ホスト側のファイルシステムにデータを保存することで、コンテナを再起動してもデータが保持されます。
  
- **設定**: `docker-compose.yml` でボリュームとしてマウントされています。

#### `phpmyadmin/config.user.inc.php`

- **役割**: phpMyAdminのカスタム設定を行うためのファイル。必要に応じて追加設定を行います。
  
- **場所**: `phpmyadmin/` ディレクトリ内に配置します。

- **例**:
  
  <?php
  /* MySQL server hostname */
  $cfg['Servers'][1]['host'] = 'db';
  /* User for advanced features */
  $cfg['Servers'][1]['controluser'] = 'user';
  $cfg['Servers'][1]['controlpass'] = 'password';
  /* Storage database and tables */
  $cfg['Servers'][1]['pmadb'] = 'phpmyadmin';
  $cfg['Servers'][1]['bookmarktable'] = 'pma__bookmark';
  $cfg['Servers'][1]['relation'] = 'pma__relation';
  $cfg['Servers'][1]['table_info'] = 'pma__table_info';
  $cfg['Servers'][1]['table_coords'] = 'pma__table_coords';
  $cfg['Servers'][1]['pdf_pages'] = 'pma__pdf_pages';
  $cfg['Servers'][1]['column_info'] = 'pma__column_info';
  $cfg['Servers'][1]['history'] = 'pma__history';
  $cfg['Servers'][1]['designer_coords'] = 'pma__designer_coords';
  ?>
