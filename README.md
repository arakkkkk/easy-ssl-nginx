# Docker Nginx with SSL Proxy
* このリポジトリは、Nginxを使用したSSL対応のリバースプロキシを構築するための設定を含んでいます。
* 自己署名証明書を使用してSSLを有効化し、指定されたバックエンドアプリケーションにプロキシします。

## Usage
### clone
```bash
git clone <repository-url>
cd <repository-directory>
```

### 環境変数の設定
* DOMAIN: サーバードメイン名 (例: example.com)
* APP_PORT: バックエンドアプリケーションのポート (例: 8080)
* HOST_IP: バックエンドアプリケーションが動作しているサーバのIPアドレス (例: 192.168.2.10)

### build
```bash
docker compose up -d
```

## 注意
* 自己署名証明書を使用しています: 本番環境で使用する場合は、信頼できる認証機関（CA）から取得した証明書に置き換えることを推奨します。
* 環境変数が正しく設定されていない場合、コンテナの起動時にエラーが発生します。






