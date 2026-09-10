# Zensical build/preview environment for KenKoba2119.github.io
FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    HOME=/tmp

# zensical は 0.0.x で変更が速いのでバージョンを固定する。
# 更新するときはここと .github/workflows/docs.yml の両方を合わせること。
ARG ZENSICAL_VERSION=0.0.60
RUN pip install --no-cache-dir \
      "zensical==${ZENSICAL_VERSION}" \
      jinja2 \
      pyyaml

WORKDIR /src
EXPOSE 8000

# サブコマンドを docker compose run から渡せるように ENTRYPOINT を zensical にする
ENTRYPOINT ["zensical"]

# コンテナ内では localhost ではなく 0.0.0.0 で待ち受ける必要がある
CMD ["serve", "-a", "0.0.0.0:8000"]
