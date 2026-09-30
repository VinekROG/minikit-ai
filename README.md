# minikit-ai

> Ask questions about your own documents. Nothing is uploaded. Nothing leaves your computer.

[English](README.md) · [Español](README.es.md) · [Français](README.fr.md) · [Português](README.pt.md) · [中文](README.zh.md) · [हिन्दी](README.hi.md) · [العربية](README.ar.md)

**Windows 10/11** · no administrator rights · one installer file · works with the internet disconnected.

[![Releases](https://img.shields.io/github/v/release/VinekROG/minikit-ai)](https://github.com/VinekROG/minikit-ai/releases/latest)
[![License](https://img.shields.io/badge/license-see%20LICENSE-informational)](LICENSE)

---

## 1. What this is

Point it at a folder of documents. It reads them, remembers them, and answers questions
about them in plain language — showing you the exact passages it used.

- **PDF**, **Word (.docx)**, **Markdown** and **plain text**
- Everything runs on your computer: the AI models, the database, the web panel
- No account, no API key, no subscription, no telemetry

## 2. Install in four steps

### Step 1 — Install Ollama

Ollama is the free, open-source engine that runs the AI models on your own machine.

1. Go to **<https://ollama.com/download>**
2. Download the Windows version and run the installer
3. Leave it installed. You do not need to start it manually yet.

### Step 2 — Download the two AI models

Open **Command Prompt** (press `Win`, type `cmd`, press Enter) and paste these two lines,
one at a time:

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 MB) turns text into numbers so the program can search it
- `qwen2.5:0.5b` (400 MB) writes the answers

These are deliberately tiny. The whole point is that it works on an old, cheap computer.
If you have more memory and want better answers, you can use `qwen2.5:3b` instead later.

### Step 3 — Run the installer

1. Go to **<https://github.com/VinekROG/minikit-ai/releases/latest>**
2. Download `minikit-ai-1.0.0-beta-setup.exe` (about 4 MB)
3. Double-click it
4. Windows will show a blue warning screen. This is normal — see the note below.
5. Click **More info → Run anyway**
6. The installer never asks for administrator rights

> **About the blue warning:** Windows shows it because the file has no digital signature.
> The author does not have a code-signing certificate. The warning says "unrecognized
> app", not "virus". Once you have installed it, this message appears only once.

### Step 4 — Start it

1. Press the Windows key and type **minikit-ai**
2. Press Enter
3. A small black window opens and your web browser opens by itself
4. That is the program. The black window must stay open.

---

## 3. Use it

1. **Add documents.** Drag a file onto the window, or type the path of a folder such as
   `C:\Users\You\Documents\contracts` and press *Index*.
2. **Ask a question.** Type it in the box on the right, in whatever language you like.
3. **Read the sources.** The answer lists the passages it used, so you can check it.

The first answer takes a while (30–90 seconds on an older computer) because the model is
being loaded into memory for the first time. Later answers are much faster.

Supported formats: `.pdf` `.docx` `.txt` `.md`

---

## 4. Why your documents stay private

This is the part that matters, so here is exactly what is done — not a promise, a
description of the mechanism.

### 4.1 The network is physically dark

Every single outgoing connection the program makes passes through one gate. That gate
allows exactly one destination: `127.0.0.1`, your own computer. Nothing else. Not a
web address, not a domain name, not another device on your network.

If anything at all tries to connect outward — a programming mistake, a corrupted file, a
malicious instruction hidden inside one of your own documents — three things happen at
once:

1. The connection is refused.
2. The document data held in memory is overwritten with zeros.
3. The attempt is written to a log you can read in the panel.

You can test this yourself at any time. Press the **Run self-test** button in
the panel. It deliberately tries to reach `1.1.1.1` and `example.com` and shows you the
refusals.

### 4.2 Other people cannot use your copy remotely

The panel is bound to your own machine, requires a random password generated every time it
starts, rejects requests whose address does not match your computer, and refuses to answer
if someone sends too many requests at once. A web page you happen to have open in another
tab cannot talk to it.

---

## 5. Honest limits

Being straight with you is worth more than a good marketing page.

| | |
|---|---|
| **Not code-signed** | Windows warns you on first run. `More info → Run anyway`. |
| **Database is not encrypted** | Your documents are stored in a file in your user folder. Anyone with access to your Windows account can read it. |
| **It quotes, it does not reason** | It finds and repeats what your documents say. It will not calculate or deduce. |
| **Answers can be wrong** | The model is small on purpose. Always check the cited passages. |
| **One user at a time** | Designed for one person on one computer. Not a shared server. |

---

## 6. Common questions

**Do I need an internet connection?**
Only while installing and while downloading the AI models. Afterwards you can disconnect
and it keeps working.

**Does it send anything to a company?**
No. The program is physically unable to: the only network destination it accepts is
`127.0.0.1`. Section 4.1 explains how, and section 4.1 also explains how to test it.

**How do I remove it?**
Settings → Installed apps → minikit-ai → Uninstall. Your documents are kept, not deleted,
so reinstalling later does not lose your index.

**My computer is slow. What can I do?**
Close other programs while asking questions. The first answer is always the slowest.

**Something went wrong.**
Open Command Prompt and type `minikit-ai doctor`. It prints exactly what is missing.

---

## 7. For developers

See [SECURITY.md](SECURITY.md) for how to report a vulnerability and [LICENSE](LICENSE) for
the terms of use.

**Thank you for using it.**
