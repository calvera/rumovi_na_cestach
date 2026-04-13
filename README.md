# Rumovi na cestách

Statický web generovaný [Hugem](https://gohugo.io/). Obsah je v Markdownu v adresáři `content/`, šablony v `layouts/`, CSS a statické prvky (např. banner) v `static/`. Fotografie v článcích jsou v `assets/images/<stejná-cesta-jako-článek>/` (např. `assets/images/malajsie-2009/2009-02-02-singapore/`) a zpracovává je Hugo (náhled v textu, plná velikost v lightboxu).

## Požadavky

- [Hugo Extended](https://gohugo.io/installation/) 0.125+ (kvůli kompatibilnímu `hugo.toml` a menu)

## Lokální vývoj

Pokud Hugo hlásí chybu při zápisu do domovského cache adresáře, nastavte cache do projektu:

```bash
export HUGO_CACHEDIR="$PWD/.hugo_cache"
```

```bash
hugo server -D
```

Otevřete v prohlížeči uvedenou adresu (obvykle `http://localhost:1313`).

## Sestavení

```bash
hugo --gc --minify
```

Výstup je ve složce `public/` — tu nasadte na GitHub Pages, Netlify, Cloudflare Pages nebo na VPS (nginx/apache s `root` na tuto složku).

## Doplňování plných JPG (`assets/images/`)

V Markdownu používejte `![popis](/images/<sekce>/<slug-článku>/nazev-souboru.jpg)` — odpovídá to složce `assets/images/<sekce>/<slug-článku>/`. Chybějící plné soubory lze z původního webu doplnit skriptem (po `pip install -r requirements.txt`):

```bash
.venv/bin/python scripts/download_uploads_from_site.py
```

Volitelně `--base https://www.rumovinacestach.cz`. Lokální záloha ve `static/uploads/jpg/` se při stahování zkopíruje do `assets/images/`, pokud existuje. Inventura původního webu: [docs/INVENTORY.md](docs/INVENTORY.md).

## Kontaktní formulář (Web3Forms)

V [hugo.toml](hugo.toml) nastavte `params.web3forms_access_key` na klíč z [web3forms.com](https://web3forms.com). Bez klíče se na stránce kontaktu zobrazí návod místo formuláře.

## Nasazení na GitHub Pages

Repozitář obsahuje workflow [`.github/workflows/hugo.yml`](.github/workflows/hugo.yml), který při pushi do `main` sestaví web a publikuje ho na GitHub Pages. V nastavení repozitáře zapněte **Pages** → zdroj: **GitHub Actions**.

`baseURL` v `hugo.toml` upravte na URL vašeho GitHub Pages (`https://<user>.github.io/<repo>/`) nebo vlastní doménu.

## Nasazení na VPS

Postup s `rsync` a úpravou `baseURL` je v [docs/DEPLOY-VPS.md](docs/DEPLOY-VPS.md). Šablonu příkazu najdete v [`scripts/deploy-rsync.example.sh`](scripts/deploy-rsync.example.sh).

## DNS a dvě domény

Pokud používáte `rumovinacestach.cz` i `rumovi-na-cestach.cz`, nastavte u registrátora záznamy na váš hosting a na jedné doméně případně HTTP přesměrování na kanonickou variantu (např. v Cloudflare nebo v nginx).
