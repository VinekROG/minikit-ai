# Security policy

## Reporting a vulnerability

If you find a way to make `minikit-ai` send data outside the computer, or to read
documents that belong to another user, **that is a serious problem and I want to know
about it.**

Report it privately, not as a public issue:

- Open a **private security advisory** on this repository
  (`Security` → `Report a vulnerability`), or
- Use the contact address listed on the project page.

Please include:

- what you did, step by step
- what you expected and what happened instead
- the version number (`minikit-ai version`)

I aim to acknowledge a report within 72 hours.

**Please do not** test against a public demo instance, against a machine that is not
yours, or with anyone's real documents. The program's own self-test button exists
precisely so that you do not need to attack anything.

## What is already defended

These are implemented in code, not just documented, and each one has automated tests
that fail if the protection is removed.

| Threat | Defence |
|---|---|
| Data leaving over the network | Every outbound connection is forced through a dialer that accepts only the loopback address. Anything else is refused, the in-memory buffers are zeroed and the attempt is logged. |
| DNS rebinding against the local panel | The `Host` header is validated; requests addressed to anything other than loopback get `403`. |
| Another website using your panel | A random per-session token is required, delivered as an `HttpOnly`, `SameSite=Strict` cookie. Requests without it get `401`. |
| Reading arbitrary files through the panel | Server-side path indexing is refused entirely in hosted mode; the browser form does not offer it. |
| Wiping someone's corpus | The clear endpoint returns `403` in hosted mode. |
| UNC path credential theft | Same as above: `\\host\share` paths are never accepted. |
| Clickjacking, injected scripts | A strict `Content-Security-Policy` with `default-src 'none'`, `frame-ancestors 'none'`, plus `nosniff`, `X-Frame-Options: DENY` and `no-referrer`. |
| Denial of service | Per-client request budgets with a tighter budget for the chat endpoint, a hard cap on concurrent generations, capped request bodies and capped question length. |
| Memory disclosure | `pprof` profiling is never enabled in hosted mode. |
| Copying the program | The installer's terms forbid redistributing or reverse-engineering the binaries; see `LICENSE`. |

## What is *not* defended

Stated plainly, because pretending otherwise would be the worst thing this page
could do.

| | |
|---|---|
| **The encryption key is in the binary** | Assets are decrypted at run time, so the key must be present. This raises the cost of extraction; it is not DRM. Someone who patches the executable can read the interface at run time. |
| **The installer is not code-signed** | The origin of the binary cannot be cryptographically verified, and SmartScreen warns on first run. |

## Known weaknesses

Stated plainly, because a security page that only lists wins is marketing, not
information.

| | |
|---|---|
| **The document database is not encrypted at rest** | Your documents are stored in a SQLite file under your user profile. Anyone with access to your Windows account can read it. Encryption at rest is not implemented. |
| **The installer is not code-signed** | There is no signing certificate, so Windows SmartScreen warns on first run and the binary's origin cannot be cryptographically verified. |
| **A local attacker with code execution can bypass everything** | The anti-exfiltration gate lives inside the program. Malware that can read process memory or inject into it is not stopped by this. |
| **Prompt injection inside your own documents** | If one of the documents you index contains text designed to manipulate the model, the model can be influenced. It still cannot reach the network. |
| **Answers can be factually wrong** | A small model was chosen so it runs on modest hardware. Verify the cited passages. |

## Scope

In scope: the installer, the executable, the local web panel, the asset-encryption
scheme, and any hosted demo instance.

Out of scope: vulnerabilities in Ollama, in the upstream models, or in the Go standard
library — report those to their own maintainers.
