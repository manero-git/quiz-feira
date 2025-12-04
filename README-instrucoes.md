Quiz EMEB Constancio — Como compartilhar/testar

Arquivos principais:
- `Untitled-1.html` — página do quiz (aberta localmente em `file:///...`).
- `qr.png` — QR code gerado para o endereço atual (salvo na pasta).

Observações sobre o QR e uso em celular
- O QR embutido na página aponta para `location.href` (quando abrir o HTML localmente, ele codificará o `file:///` correspondente).
- Muitos navegadores em celulares não permitem abrir URLs `file://` por motivos de segurança. Se o QR apontar para `file://...`, seu celular pode não conseguir abrir o arquivo diretamente.

Opções para compartilhar o quiz com qualquer celular (recomendadas):
1) Publicar com GitHub Pages
   - Crie um repositório no GitHub e envie os arquivos da pasta (`Untitled-1.html`, `qr.png`, etc.).
   - Ative GitHub Pages nas configurações do repositório (branch `main` ou `gh-pages`).
   - Depois de publicado, o site terá uma URL `https://<seu-usuario>.github.io/<repo>/Untitled-1.html`.
   - Atualize o QR para apontar para essa URL (ou reabra a página publicada; o QR dinâmico no HTML usará `location.href`).

2) Usar um túnel temporário (ngrok) para teste local
   - Instale ngrok (https://ngrok.com/) e execute `ngrok http 8000` apontando para a máquina que roda o servidor.
   - ngrok fornecerá uma URL pública (ex.: `https://abcd1234.ngrok.io`) que você pode abrir no celular.
   - Gere um QR apontando para essa URL.

3) Servir via rede local
   - Inicie um servidor HTTP na máquina (por exemplo, `python -m http.server 8000`) e descubra o IP local (`ipconfig`).
   - No celular, abra `http://<seu-ip-local>:8000/Untitled-1.html` (mesma rede Wi-Fi). O QR pode apontar para essa URL.

Como atualizar o QR (se publicar):
- Se publicar em GitHub Pages ou obter uma URL pública, abra a página publicada no navegador e o QR dinâmico embutido será gerado automaticamente para `location.href`.
- Alternativamente, gere um novo `qr.png` substituindo o arquivo existente usando o serviço `https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=<URL>`.

Se quiser, eu posso:
- Ajudar passo a passo a publicar no GitHub Pages (criar repositório, commits, push).
- Gerar um QR apontando para uma URL pública (se você me fornecer a URL ou permitir configurar um túnel ngrok). 
- Instruir para instalar ngrok e arrancar um túnel nesta máquina.

