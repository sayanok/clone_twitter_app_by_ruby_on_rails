# clone_twitter_app_by_ruby_on_rails

Ruby on Rails 7.2 / PostgreSQL / Docker 開発環境。ビューは ERB、テストは RSpec です。

## 前提

- Docker / Docker Compose が使えること

## 起動

```bash
docker compose up --build
```

初回は Gem のインストールに数分かかることがあります。2 回目以降は `bundle_data` ボリュームで高速化されます。

アプリは http://localhost:3000 です。PostgreSQL はコンテナ内のみ（ホストの 5432 と競合しないようポートは公開していません）。

## よく使うコマンド（コンテナ内）

```bash
# Rails コンソール
docker compose run --rm web ./bin/rails console

# マイグレーション
docker compose run --rm web ./bin/rails db:migrate

# RSpec（テスト環境は DB_HOST などが compose で渡る想定）
docker compose run --rm -e RAILS_ENV=test web bundle exec rspec
```

## ホストから PostgreSQL に接続したい場合

`docker-compose.yml` の `db` サービスに `ports: ["5433:5432"] のようにポートを追加し、クライアントから `localhost:5433` に接続してください。

## ローカル（Docker なし）で開発する場合

`config/database.yml` の `DB_HOST` 未設定時は `localhost` を参照します。ローカルに PostgreSQL を用意し、`POSTGRES_USER` / `POSTGRES_PASSWORD` を環境変数で合わせてください。
