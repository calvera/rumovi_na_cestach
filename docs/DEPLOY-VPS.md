# Nasazení na VPS (statické soubory)

1. Na serveru mějte nainstalovaný webový server (nginx nebo Apache) s `root` ukazujícím na adresář s HTML.

2. Lokálně nebo v CI sestavte web:

   ```bash
   hugo --gc --minify
   ```

3. Nahrajte obsah složky `public/` na server, například:

   ```bash
   rsync -avz --delete public/ user@váš-server:/var/www/rumovi/html/
   ```

   Upravte cílovou cestu podle vašeho nastavení.

4. V `hugo.toml` nastavte `baseURL` na veřejnou URL webu (včetně `https://` a koncového `/`), aby fungovaly absolutní cesty v menu a RSS, pokud je přidáte.

5. Pro vlastní doménu nastavte u registrátora A/AAAA nebo CNAME záznamy na IP nebo hostname serveru.
