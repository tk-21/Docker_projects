# php-fpm_tuning
## コンテナを起動する
docker-compose up -d

## Grafanaの設定
Grafanaでダッシュボードを作成する手順は以下の通りです。

### ステップ1: Grafanaにログイン
1. ブラウザで`http://localhost:3000`にアクセスします。
2. デフォルトのログイン情報は`admin` / `admin`です。ログイン後、パスワードの変更を求められます。

### ステップ2: データソースの設定
1. 左のサイドメニューから「設定（gearアイコン）」をクリックし、「Data Sources」を選択します。
2. 「Add data source」をクリックします。
3. 「Prometheus」を選択します。
4. URLに`http://prometheus:9090`を入力し、「Save & Test」をクリックします。

### ステップ3: ダッシュボードの作成
1. 左のサイドメニューから「＋（プラスアイコン）」をクリックし、「Dashboard」を選択します。
2. 「Add new panel」をクリックします。

### ステップ4: パネルの設定
1. パネルのエディタが表示されます。ここでメトリクスを設定します。
2. 「Query」タブで、Prometheusから取得したいメトリクスを入力します。

   例えば、各コンテナのCPU使用率を表示するためには以下のようなクエリを使用します：
   ```promql
   rate(container_cpu_usage_seconds_total[1m])
   ```

   メモリ使用量を表示するためには以下のクエリを使用します：
   ```promql
   container_memory_usage_bytes
   ```

3. パネルのタイトルや表示形式を設定します。例えば、グラフ、ゲージ、テーブルなどを選択できます。
4. 設定が完了したら「Apply」をクリックします。

### ステップ5: ダッシュボードの保存
1. パネルを追加したら、ダッシュボード全体を保存します。
2. 右上の「保存（diskアイコン）」をクリックし、ダッシュボードの名前を入力して「Save」をクリックします。

### 例: CPUとメモリのダッシュボード
1. CPU使用率のパネルを作成します：
   - クエリ：`rate(container_cpu_usage_seconds_total[1m])`
   - 表示形式：グラフ

2. メモリ使用量のパネルを作成します：
   - クエリ：`container_memory_usage_bytes`
   - 表示形式：グラフ

これで、負荷テストを行いながら、Grafanaでリアルタイムにリソース使用状況を観察することができます。

### サンプルクエリ
- **CPU使用率**:
  ```promql
  rate(container_cpu_usage_seconds_total{container_label_com_docker_compose_service="php"}[1m])
  ```
- **メモリ使用量**:
  ```promql
  container_memory_usage_bytes{container_label_com_docker_compose_service="php"}
  ```

これらのクエリは、`php`サービスのCPUとメモリの使用状況を表示する例です。各サービスの名前を変更して、他のサービスのリソース使用状況を表示することもできます。

これで、高度な監視を行うためのGrafanaダッシュボードが完成します。負荷テストの結果をリアルタイムで監視し、PHP-FPMのチューニング効果を評価するのに役立ててください。

