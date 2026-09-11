.PHONY: image serve build news shell clean

# イメージのビルド（初回、および Dockerfile 変更時）
image:
	docker compose build

# プレビュー（http://localhost:8000）
serve:
	docker compose up

# 静的ファイルの生成（site/ に出力）
build:
	docker compose run --rm site build --clean

# _data/news.yml から docs/news.md と index.md を再生成（news 方式を採用する場合のみ）
news:
	docker compose run --rm --entrypoint python site generate.py

# コンテナ内でシェルを開く
shell:
	docker compose run --rm --entrypoint bash site

# 生成物の削除
clean:
	rm -rf site
