# Inventura původního webu (Rumovi na cestách)

Migrace do Hugo je hotová: texty a obrázky jsou v `content/` a `static/`. Níže stručný přehled toho, jak původní hosting fungoval (pro kontext a údržbu skriptů).

## Hlavní sekce (odpovídají menu v Hugu)

| Sekce | Poznámka |
|--------|----------|
| Úvod (cz) | `/cz/index.html` na původním webu |
| Malajsie 2009 | sekce `/cz/malajsie-2009/` |
| Na Jihovýchod Ilyrským mořem… | `/cz/na-jihovychod-ilyrskym-morem/` |
| Závažné dopady jedné expedice… | `/cz/zavazne-dopady-jedne-expedice/` |
| Suchozemské epizodky | `/cz/suchozemske-epizodky/` |
| Kontaktní formulář | POST na starý endpoint — v Hugu [Web3Forms](https://web3forms.com) (`layouts/_partials/contact-form.html`) |
| Mapa stránek | `/cz/mapa-stranek/` |

## Technické závislosti (původní web)

- **Galerie:** odkazy na `multimedia.inc.php?...` — dynamické výstupy; skript `scripts/download_uploads_from_site.py` sestaví mapu z HTML stránek `…/cz/…/index.html` na živém webu
- **Formulář:** nahrazeno Web3Forms v Hugu
- **Analytics:** Google Analytics + pixel v patičce — v novém webu záměrně nekopírováno

## Migrováno do Huga

- Texty úvodních stránek sekcí → `content/*.md` a podsložky
- Obrázky v `static/images/` (banner apod.) a fotky v článcích v `assets/images/<content-path>/` vedle odpovídajícího Markdownu (Hugo image processing)
