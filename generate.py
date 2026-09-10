import yaml
import re
from jinja2 import Environment, FileSystemLoader

with open("_data/news.yml", encoding="utf-8") as f:
    news = yaml.safe_load(f)

news.sort(key=lambda x: x["date"], reverse=True)

for item in news:
    item["year"] = item["date"][:4]

env = Environment(loader=FileSystemLoader("_templates"))

# news.md生成
tmpl = env.get_template("news.md.j2")
with open("docs/news.md", "w", encoding="utf-8") as f:
    f.write(tmpl.render(news=news))

# index.mdのニュースセクションを最新4件で差し替え
tmpl = env.get_template("index_news.md.j2")
news_content = tmpl.render(news=news[:4])

with open("docs/index.md", "r", encoding="utf-8") as f:
    index = f.read()

index = re.sub(
    r"(## 最新のお知らせ / Latest News\n).*",
    r"\1" + news_content,
    index,
    flags=re.DOTALL
)

with open("docs/index.md", "w", encoding="utf-8") as f:
    f.write(index)
