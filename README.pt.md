# minikit-ai

> Faça perguntas aos seus próprios documentos. Nada é enviado. Nada sai do seu computador.

[English](README.md) · [Español](README.es.md) · [Français](README.fr.md) · [Português](README.pt.md) · [中文](README.zh.md) · [हिन्दी](README.hi.md) · [العربية](README.ar.md)

**Windows 10/11** · sem direitos de administrador · um único instalador · funciona sem internet.

---

## 1. O que é

Aponte-o para uma pasta de documentos. Ele lê, memoriza e responde a perguntas sobre eles
em linguagem natural — mostrando exatamente os trechos que utilizou.

- **PDF**, **Word (.docx)**, **Markdown** e **texto simples**
- Tudo acontece no seu computador: os modelos de IA, o banco de dados, o painel web
- Sem conta, sem chave de API, sem assinatura, sem telemetria

## 2. Instalação em quatro passos

### Passo 1 — Instale o Ollama

O Ollama é o motor livre e de código aberto que executa os modelos de IA na sua própria
máquina.

1. Acesse **<https://ollama.com/download>**
2. Baixe a versão para Windows e instale
3. Deixe instalado. Ainda não precisa iniciá-lo.

### Passo 2 — Baixe os dois modelos de IA

Abra o **Prompt de comando** (tecla `Win`, digite `cmd`, Enter) e cole estas duas linhas,
uma de cada vez:

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 MB) transforma o texto em números para o programa poder
  pesquisá-lo
- `qwen2.5:0.5b` (400 MB) escreve as respostas

São minúsculos de propósito: o objetivo é funcionar num computador velho e barato. Se tiver
mais memória e quiser respostas melhores, pode trocar por `qwen2.5:3b` depois.

### Passo 3 — Execute o instalador

1. Acesse **<https://github.com/OWNER/minikit-ai/releases/latest>**
2. Baixe `minikit-ai-0.1.0-setup.exe` (cerca de 4 MB)
3. Dê duplo clique
4. O Windows mostrará um aviso azul. É normal — veja a nota abaixo.
5. Clique em **Mais informações → Executar assim mesmo**
6. O instalador nunca pede direitos de administrador

> **Sobre o aviso azul:** o Windows mostra porque o arquivo não tem assinatura digital. O
> autor não possui certificado de assinatura. O aviso diz "aplicativo não reconhecido", não
> "vírus". Depois de instalado, esta mensagem aparece só uma vez.

### Passo 4 — Inicie o programa

1. Aperte a tecla do Windows e digite **minikit-ai**
2. Aperte Enter
3. Abre uma pequena janela preta e o seu navegador abre sozinho
4. Esse é o programa. A janela preta precisa ficar aberta.

---

## 3. Como usar

1. **Adicione documentos.** Arraste um arquivo para a janela, ou digite o caminho de uma
   pasta como `C:\Users\Você\Documentos\contratos` e clique em *Indexar*.
2. **Faça uma pergunta.** Escreva na caixa à direita, no idioma que quiser.
3. **Veja as fontes.** A resposta lista os trechos usados, para você conferir.

A primeira resposta demora (30 a 90 segundos num computador antigo) porque o modelo é
carregado na memória pela primeira vez. As seguintes são bem mais rápidas.

Formatos aceitos: `.pdf` `.docx` `.txt` `.md`

---

## 4. Por que seus documentos ficam privados

Esta é a parte importante, então aqui está exatamente o que o programa faz: não uma
promessa, uma descrição do mecanismo.

### 4.1 A rede está realmente apagada

Todas as conexões de saída do programa passam por um único portão. Esse portão permite
exatamente um destino: `127.0.0.1`, o seu próprio computador. Mais nada. Nem um endereço
web, nem um nome de domínio, nem outro equipamento da sua rede.

Se alguma coisa tentar sair — um erro de programação, um arquivo corrompido, uma instrução
maliciosa escondida dentro de um dos seus próprios documentos — três coisas acontecem ao
mesmo tempo:

1. A conexão é recusada.
2. Os dados dos documentos que estavam na memória são sobrescritos com zeros.
3. A tentativa é registrada num log que você pode ler no painel.

Você pode verificar isso quando quiser. Clique no botão **Executar autoteste** do painel: ele
tenta de propósito alcançar `1.1.1.1` e `example.com` e mostra as recusas.

### 4.2 Ninguém pode usar a sua cópia à distância

O painel está preso à sua máquina, exige uma senha aleatória gerada a cada inicialização,
recusa pedidos cujo endereço não seja o do seu computador e não responde se alguém enviar
pedidos demais seguidos. Uma página web aberta em outra aba não consegue falar com ele.

### 4.3 O código não é publicado

Este repositório contém o instalador e a documentação. **O código-fonte não está aqui.** Se
quer ver como funciona, isso se conversa diretamente, não é algo que você possa copiar de
um site.

### 4.4 A interface é criptografada dentro do programa

O HTML, o CSS e o JavaScript do painel ficam guardados criptografados dentro do executável
e só são descriptografados na memória enquanto ele está rodando. Abrir o arquivo num editor
de texto ou descompactar o programa não revela nada.

---

## 5. Limites honestos

Ser honesto com você vale mais do que uma boa página de marketing.

| | |
|---|---|
| **Sem assinatura digital** | O Windows avisa na primeira vez: `Mais informações → Executar assim mesmo`. |
| **O banco de dados não é criptografado** | Seus documentos ficam num arquivo na sua pasta de usuário. Quem tiver acesso à sua conta do Windows pode ler. |
| **Ele cita, não raciocina** | Encontra e repete o que os seus documentos dizem. Não calcula nem deduz. |
| **As respostas podem estar erradas** | O modelo é pequeno de propósito. Confira sempre os trechos citados. |
| **Um usuário por vez** | Feito para uma pessoa e um computador. Não é um servidor compartilhado. |

---

## 6. Perguntas frequentes

**Preciso de internet?**
Só durante a instalação e ao baixar os modelos. Depois você pode desconectar e continua
funcionando.

**Manda alguma coisa para alguma empresa?**
Não. O programa é incapaz de fazer isso: o único destino de rede que ele aceita é
`127.0.0.1`. A seção 4.1 explica por quê, e também explica como verificar.

**Como desinstalar?**
Configurações → Aplicativos instalados → minikit-ai → Desinstalar. Seus documentos são
mantidos, não apagados: se reinstalar, não perde o índice.

**Meu computador é lento. O que faço?**
Feche os outros programas enquanto pergunta. A primeira resposta é sempre a mais lenta.

**Algo deu errado.**
Abra o Prompt de comando e digite `minikit-ai doctor`. Ele imprime exatamente o que está
faltando.

---

## 7. Para desenvolvedores

O código-fonte não está neste repositório. Veja [SECURITY.md](SECURITY.md) para relatar uma
vulnerabilidade e [LICENSE](LICENSE) para os termos de uso.

**Obrigado por usar.**
