### ステップ 1: Docker Compose の起動

以下のコマンドを実行して、Docker Compose を起動します。

```bash
docker-compose up -d
```

### ステップ 2: 各コンテナのメモリ使用状況を監視

#### 1. `busybox`コンテナで監視

`busybox`コンテナに接続して、`top`コマンドを使用してリソース使用状況をリアルタイムで監視します。

```bash
docker attach busybox
```

`top`のインターフェースが表示され、メモリの使用状況やプロセスの詳細が観察できます。

#### 2. `ubuntu`コンテナで監視

`ubuntu`コンテナに接続して、`vmstat`や`free`コマンドを使用してメモリの動きを観察します。

```bash
docker exec -it ubuntu /bin/bash
```

コンテナ内で以下のコマンドを実行します：

- **vmstat**を使用してメモリとスワップの使用状況を観察
  ```bash
  vmstat 1 5
  ```

- **free**を使用してメモリの概要を表示
  ```bash
  free -m
  ```

### ホストシステムのメモリ使用状況を監視

ホストシステム全体のメモリ使用状況を監視するには、以下のコマンドを使用します：

- **docker stats**：
  - 実行中の全てのコンテナのリアルタイムのリソース使用状況を表示します。
  ```bash
  docker stats
  ```

- **htop**や**top**：
  - ホストシステムで`htop`や`top`を実行して、システム全体のリソース使用状況を監視します。
  ```bash
  htop
  ```

この更新された`docker-compose.yml`を使用することで、各コンテナのメモリ使用状況を個別に監視し、ホストシステム全体のメモリ使用状況を把握することができます。



---


負荷の調整は、`stress`コンテナのコマンド部分で行います。具体的には、`stress-ng`コマンドのパラメータを変更することで、負荷の強度や持続時間を調整できます。

### `stress`コンテナの負荷調整

`docker-compose.yml`ファイルの`stress`コンテナ部分を以下のように変更することで、負荷の調整が可能です。

```yaml
version: '3.8'

services:
  stress:
    image: alpine:latest
    container_name: stress_test
    command: ["sh", "-c", "apk add --no-cache stress-ng && stress-ng --vm 1 --vm-bytes 256M --vm-keep --timeout 300s"]
    deploy:
      resources:
        limits:
          memory: 512M

  busybox:
    image: busybox:latest
    container_name: busybox
    tty: true
    stdin_open: true
    command: ["sh", "-c", "while true; do top; sleep 1; done"]
    deploy:
      resources:
        limits:
          memory: 128M

  ubuntu:
    image: ubuntu:latest
    container_name: ubuntu
    tty: true
    stdin_open: true
    command: ["/bin/bash", "-c", "apt-get update && apt-get install -y procps && while true; do sleep 1000; done"]
    deploy:
      resources:
        limits:
          memory: 128M
```

### パラメータの説明

- **`--vm 1`**：1つの仮想メモリストリームを作成します。
- **`--vm-bytes 256M`**：各仮想メモリストリームで256MBのメモリを使用します。
- **`--vm-keep`**：メモリストリームがメモリを解放しないようにします。
- **`--timeout 300s`**：300秒間負荷をかけます。

### 負荷の調整方法

- **メモリ負荷を増やす**：
  - `--vm-bytes`の値を増やします（例：`--vm-bytes 512M`）。
- **負荷をかける仮想メモリストリームの数を増やす**：
  - `--vm`の値を増やします（例：`--vm 2`）。
- **負荷をかける時間を変更する**：
  - `--timeout`の値を変更します（例：`--timeout 600s`）。

### 具体例

#### メモリ負荷を512MBに増やす場合

```yaml
command: ["sh", "-c", "apk add --no-cache stress-ng && stress-ng --vm 1 --vm-bytes 512M --vm-keep --timeout 300s"]
```

#### 仮想メモリストリームを2に増やす場合

```yaml
command: ["sh", "-c", "apk add --no-cache stress-ng && stress-ng --vm 2 --vm-bytes 256M --vm-keep --timeout 300s"]
```

#### 負荷をかける時間を600秒に増やす場合

```yaml
command: ["sh", "-c", "apk add --no-cache stress-ng && stress-ng --vm 1 --vm-bytes 256M --vm-keep --timeout 600s"]
```

### ステップ 1: Docker Compose の起動

以下のコマンドを実行して、Docker Compose を再起動します。

```bash
docker-compose up -d
```

### ステップ 2: 各コンテナのメモリ使用状況を監視

#### `busybox`コンテナで監視

```bash
docker attach busybox
```

#### `ubuntu`コンテナで監視

```bash
docker exec -it ubuntu /bin/bash
```

コンテナ内で以下のコマンドを実行します：

```bash
vmstat 1 5
```

```bash
free -m
```

### ホストシステムのメモリ使用状況を監視

```bash
docker stats
```

```bash
htop
```

この設定により、`stress`コンテナのメモリ負荷を調整しながら、各コンテナのメモリ使用状況を個別に監視することができます。