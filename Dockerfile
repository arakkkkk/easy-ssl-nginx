# ベースイメージとしてNginxを使用
FROM nginx:latest

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y openssl && apt-get clean

# 自己署名証明書を生成
RUN mkdir -p /etc/nginx/certs && \
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/certs/server.key \
  -out /etc/nginx/certs/server.crt \
  -subj "/C=JP/ST=Tokyo/L=Local/O=LocalApp/OU=IT/CN=${DOMAIN_NAME}"

# nginx.conf.template をコンテナ内にコピー
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template

# コンテナ起動時にテンプレートを展開してnginx.confを作成
CMD envsubst '$DOMAIN $APP_PORT $HOST_IP' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
