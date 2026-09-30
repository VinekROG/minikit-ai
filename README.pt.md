# minikit-ai

> FaÃ§a perguntas aos seus prÃ³prios documentos. Nada Ã© enviado. Nada sai do seu computador.

[English](README.md) Â· [EspaÃ±ol](README.es.md) Â· [FranÃ§ais](README.fr.md) Â· [PortuguÃªs](README.pt.md) Â· [ä¸­æ–‡](README.zh.md) Â· [à¤¹à¤¿à¤¨à¥à¤¦à¥€](README.hi.md) Â· [Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©](README.ar.md)

**Windows 10/11** Â· sem direitos de administrador Â· um Ãºnico instalador Â· funciona sem internet.

---

## 1. O que Ã©

Aponte-o para uma pasta de documentos. Ele lÃª, memoriza e responde a perguntas sobre eles
em linguagem natural â€” mostrando exatamente os trechos que utilizou.

- **PDF**, **Word (.docx)**, **Markdown** e **texto simples**
- Tudo acontece no seu computador: os modelos de IA, o banco de dados, o painel web
- Sem conta, sem chave de API, sem assinatura, sem telemetria

## 2. InstalaÃ§Ã£o em quatro passos

### Passo 1 â€” Instale o Ollama

O Ollama Ã© o motor livre e de cÃ³digo aberto que executa os modelos de IA na sua prÃ³pria
mÃ¡quina.

1. Acesse **<https://ollama.com/download>**
2. Baixe a versÃ£o para Windows e instale
3. Deixe instalado. Ainda nÃ£o precisa iniciÃ¡-lo.

### Passo 2 â€” Baixe os dois modelos de IA

Abra o **Prompt de comando** (tecla `Win`, digite `cmd`, Enter) e cole estas duas linhas,
uma de cada vez:

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 MB) transforma o texto em nÃºmeros para o programa poder
  pesquisÃ¡-lo
- `qwen2.5:0.5b` (400 MB) escreve as respostas

SÃ£o minÃºsculos de propÃ³sito: o objetivo Ã© funcionar num computador velho e barato. Se tiver
mais memÃ³ria e quiser respostas melhores, pode trocar por `qwen2.5:3b` depois.

### Passo 3 â€” Execute o instalador

1. Acesse **<https://github.com/VinekROG/minikit-ai/releases/latest>**
2. Baixe `minikit-ai-0.1.0-setup.exe` (cerca de 4 MB)
3. DÃª duplo clique
4. O Windows mostrarÃ¡ um aviso azul. Ã‰ normal â€” veja a nota abaixo.
5. Clique em **Mais informaÃ§Ãµes â†’ Executar assim mesmo**
6. O instalador nunca pede direitos de administrador

> **Sobre o aviso azul:** o Windows mostra porque o arquivo nÃ£o tem assinatura digital. O
> autor nÃ£o possui certificado de assinatura. O aviso diz "aplicativo nÃ£o reconhecido", nÃ£o
> "vÃ­rus". Depois de instalado, esta mensagem aparece sÃ³ uma vez.

### Passo 4 â€” Inicie o programa

1. Aperte a tecla do Windows e digite **minikit-ai**
2. Aperte Enter
3. Abre uma pequena janela preta e o seu navegador abre sozinho
4. Esse Ã© o programa. A janela preta precisa ficar aberta.

---

## 3. Como usar

1. **Adicione documentos.** Arraste um arquivo para a janela, ou digite o caminho de uma
   pasta como `C:\Users\VocÃª\Documentos\contratos` e clique em *Indexar*.
2. **FaÃ§a uma pergunta.** Escreva na caixa Ã  direita, no idioma que quiser.
3. **Veja as fontes.** A resposta lista os trechos usados, para vocÃª conferir.

A primeira resposta demora (30 a 90 segundos num computador antigo) porque o modelo Ã©
carregado na memÃ³ria pela primeira vez. As seguintes sÃ£o bem mais rÃ¡pidas.

Formatos aceitos: `.pdf` `.docx` `.txt` `.md`

---

## 4. Por que seus documentos ficam privados

Esta Ã© a parte importante, entÃ£o aqui estÃ¡ exatamente o que o programa faz: nÃ£o uma
promessa, uma descriÃ§Ã£o do mecanismo.

### 4.1 A rede estÃ¡ realmente apagada

Todas as conexÃµes de saÃ­da do programa passam por um Ãºnico portÃ£o. Esse portÃ£o permite
exatamente um destino: `127.0.0.1`, o seu prÃ³prio computador. Mais nada. Nem um endereÃ§o
web, nem um nome de domÃ­nio, nem outro equipamento da sua rede.

Se alguma coisa tentar sair â€” um erro de programaÃ§Ã£o, um arquivo corrompido, uma instruÃ§Ã£o
maliciosa escondida dentro de um dos seus prÃ³prios documentos â€” trÃªs coisas acontecem ao
mesmo tempo:

1. A conexÃ£o Ã© recusada.
2. Os dados dos documentos que estavam na memÃ³ria sÃ£o sobrescritos com zeros.
3. A tentativa Ã© registrada num log que vocÃª pode ler no painel.

VocÃª pode verificar isso quando quiser. Clique no botÃ£o **Executar autoteste** do painel: ele
tenta de propÃ³sito alcanÃ§ar `1.1.1.1` e `example.com` e mostra as recusas.

### 4.2 NinguÃ©m pode usar a sua cÃ³pia Ã  distÃ¢ncia

O painel estÃ¡ preso Ã  sua mÃ¡quina, exige uma senha aleatÃ³ria gerada a cada inicializaÃ§Ã£o,
recusa pedidos cujo endereÃ§o nÃ£o seja o do seu computador e nÃ£o responde se alguÃ©m enviar
pedidos demais seguidos. Uma pÃ¡gina web aberta em outra aba nÃ£o consegue falar com ele.

### 4.3 O cÃ³digo nÃ£o Ã© publicado

Este repositÃ³rio contÃ©m o instalador e a documentaÃ§Ã£o. **O cÃ³digo-fonte nÃ£o estÃ¡ aqui.** Se
quer ver como funciona, isso se conversa diretamente, nÃ£o Ã© algo que vocÃª possa copiar de
um site.

### 4.4 A interface Ã© criptografada dentro do programa

O HTML, o CSS e o JavaScript do painel ficam guardados criptografados dentro do executÃ¡vel
e sÃ³ sÃ£o descriptografados na memÃ³ria enquanto ele estÃ¡ rodando. Abrir o arquivo num editor
de texto ou descompactar o programa nÃ£o revela nada.

---

## 5. Limites honestos

Ser honesto com vocÃª vale mais do que uma boa pÃ¡gina de marketing.

| | |
|---|---|
| **Sem assinatura digital** | O Windows avisa na primeira vez: `Mais informaÃ§Ãµes â†’ Executar assim mesmo`. |
| **O banco de dados nÃ£o Ã© criptografado** | Seus documentos ficam num arquivo na sua pasta de usuÃ¡rio. Quem tiver acesso Ã  sua conta do Windows pode ler. |
| **Ele cita, nÃ£o raciocina** | Encontra e repete o que os seus documentos dizem. NÃ£o calcula nem deduz. |
| **As respostas podem estar erradas** | O modelo Ã© pequeno de propÃ³sito. Confira sempre os trechos citados. |
| **Um usuÃ¡rio por vez** | Feito para uma pessoa e um computador. NÃ£o Ã© um servidor compartilhado. |

---

## 6. Perguntas frequentes

**Preciso de internet?**
SÃ³ durante a instalaÃ§Ã£o e ao baixar os modelos. Depois vocÃª pode desconectar e continua
funcionando.

**Manda alguma coisa para alguma empresa?**
NÃ£o. O programa Ã© incapaz de fazer isso: o Ãºnico destino de rede que ele aceita Ã©
`127.0.0.1`. A seÃ§Ã£o 4.1 explica por quÃª, e tambÃ©m explica como verificar.

**Como desinstalar?**
ConfiguraÃ§Ãµes â†’ Aplicativos instalados â†’ minikit-ai â†’ Desinstalar. Seus documentos sÃ£o
mantidos, nÃ£o apagados: se reinstalar, nÃ£o perde o Ã­ndice.

**Meu computador Ã© lento. O que faÃ§o?**
Feche os outros programas enquanto pergunta. A primeira resposta Ã© sempre a mais lenta.

**Algo deu errado.**
Abra o Prompt de comando e digite `minikit-ai doctor`. Ele imprime exatamente o que estÃ¡
faltando.

---

## 7. Para desenvolvedores

O cÃ³digo-fonte nÃ£o estÃ¡ neste repositÃ³rio. Veja [SECURITY.md](SECURITY.md) para relatar uma
vulnerabilidade e [LICENSE](LICENSE) para os termos de uso.

**Obrigado por usar.**
