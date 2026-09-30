# minikit-ai

> Posez des questions Ã  vos propres documents. Rien n'est envoyÃ©. Rien ne quitte votre ordinateur.

[English](README.md) Â· [EspaÃ±ol](README.es.md) Â· [FranÃ§ais](README.fr.md) Â· [PortuguÃªs](README.pt.md) Â· [ä¸­æ–‡](README.zh.md) Â· [à¤¹à¤¿à¤¨à¥à¤¦à¥€](README.hi.md) Â· [Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©](README.ar.md)

**Windows 10/11** Â· sans droits administrateur Â· un seul installeur Â· fonctionne hors ligne.

---

## 1. Qu'est-ce que c'est

Montrez-lui un dossier de documents. Il les lit, les retient, et y rÃ©pond en langage
courant â€” en vous montrant les passages exacts qu'il a utilisÃ©s.

- **PDF**, **Word (.docx)**, **Markdown** et **texte brut**
- Tout se passe sur votre machine : les modÃ¨les d'IA, la base de donnÃ©es, le panneau web
- Aucun compte, aucune clÃ© d'API, aucun abonnement, aucune tÃ©lÃ©mÃ©trie

## 2. Installation en quatre Ã©tapes

### Ã‰tape 1 â€” Installer Ollama

Ollama est le moteur libre et open source qui exÃ©cute les modÃ¨les d'IA sur votre propre
machine.

1. Allez sur **<https://ollama.com/download>**
2. TÃ©lÃ©chargez la version Windows et installez-la
3. Laissez-la installÃ©e. Vous n'avez pas encore besoin de la lancer.

### Ã‰tape 2 â€” TÃ©lÃ©charger les deux modÃ¨les d'IA

Ouvrez l'**Invite de commandes** (touche `Win`, tapez `cmd`, appuyez sur EntrÃ©e) et
copiez-collez ces deux lignes, une par une :

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 Mo) transforme le texte en nombres pour que le programme puisse
  le rechercher
- `qwen2.5:0.5b` (400 Mo) rÃ©dige les rÃ©ponses

Ils sont volontairement minuscules : le but est que Ã§a marche sur un vieux PC bon marchÃ©.
Si vous avez plus de mÃ©moire et voulez de meilleures rÃ©ponses, vous pourrez passer plus
tard Ã  `qwen2.5:3b`.

### Ã‰tape 3 â€” Lancer l'installeur

1. Allez sur **<https://github.com/VinekROG/minikit-ai/releases/latest>**
2. TÃ©lÃ©chargez `minikit-ai-0.1.0-setup.exe` (environ 4 Mo)
3. Double-cliquez
4. Windows affichera un avertissement bleu. C'est normal â€” voir la note ci-dessous.
5. Cliquez sur **Informations complÃ©mentaires â†’ ExÃ©cuter quand mÃªme**
6. L'installeur ne demande jamais les droits administrateur

> **Ã€ propos de l'avertissement bleu :** Windows l'affiche parce que le fichier n'a pas de
> signature numÃ©rique. L'auteur ne possÃ¨de pas de certificat de signature. L'avertissement
> dit Â« application non reconnue Â», pas Â« virus Â». Une fois installÃ©, ce message n'apparaÃ®t
> qu'une seule fois.

### Ã‰tape 4 â€” Lancer le programme

1. Appuyez sur la touche Windows et tapez **minikit-ai**
2. Appuyez sur EntrÃ©e
3. Une petite fenÃªtre noire s'ouvre et votre navigateur s'ouvre tout seul
4. C'est le programme. La fenÃªtre noire doit rester ouverte.

---

## 3. Utilisation

1. **Ajoutez des documents.** Glissez un fichier dans la fenÃªtre, ou tapez le chemin d'un
   dossier comme `C:\Users\Vous\Documents\contrats` et appuyez sur *Indexer*.
2. **Posez une question.** Ã‰crivez-la dans la zone de droite, dans la langue de votre choix.
3. **Lisez les sources.** La rÃ©ponse liste les passages utilisÃ©s, pour que vous puissiez
   vÃ©rifier.

La premiÃ¨re rÃ©ponse prend du temps (30 Ã  90 secondes sur un vieux PC) car le modÃ¨le est
chargÃ© en mÃ©moire pour la premiÃ¨re fois. Les suivantes sont bien plus rapides.

Formats pris en charge : `.pdf` `.docx` `.txt` `.md`

---

## 4. Pourquoi vos documents restent privÃ©s

C'est la partie importante, alors voici exactement ce que fait le programme : pas une
promesse, une description du mÃ©canisme.

### 4.1 Le rÃ©seau est Ã©teint pour de vrai

Toutes les connexions sortantes du programme passent par une seule porte. Cette porte
n'autorise qu'une seule destination : `127.0.0.1`, votre propre machine. Rien d'autre. Ni
une adresse web, ni un nom de domaine, ni un autre poste de votre rÃ©seau.

Si quoi que ce soit tente de sortir â€” une erreur de programmation, un fichier corrompu,
une instruction malveillante cachÃ©e dans l'un de vos propres documents â€” trois choses se
produisent en mÃªme temps :

1. La connexion est refusÃ©e.
2. Les donnÃ©es des documents prÃ©sentes en mÃ©moire sont Ã©crasÃ©es par des zÃ©ros.
3. La tentative est consignÃ©e dans un journal que vous pouvez lire dans le panneau.

Vous pouvez le vÃ©rifier vous-mÃªme Ã  tout moment. Appuyez sur le bouton **ExÃ©cuter
l'autotest** du panneau : il tente dÃ©libÃ©rÃ©ment d'atteindre `1.1.1.1` et `example.com` et
vous montre les refus.

### 4.2 Personne ne peut utiliser votre copie Ã  distance

Le panneau est liÃ© Ã  votre machine, exige un mot de passe alÃ©atoire gÃ©nÃ©rÃ© Ã  chaque
dÃ©marrage, rejette les requÃªtes dont l'adresse n'est pas celle de votre ordinateur, et ne
rÃ©pond pas si quelqu'un envoie trop de requÃªtes d'un coup. Une page web ouverte dans un
autre onglet ne peut pas lui parler.

### 4.3 Le code n'est pas publiÃ©

Ce dÃ©pÃ´t contient l'installeur et la documentation. **Le code source n'est pas ici.** Si
vous voulez voir comment Ã§a marche, cela se discute directement, ce n'est pas quelque chose
que vous pouvez copier depuis un site web.

### 4.4 L'interface est chiffrÃ©e dans le programme

Le HTML, le CSS et le JavaScript du panneau sont stockÃ©s chiffrÃ©s dans l'exÃ©cutable et ne
sont dÃ©chiffrÃ©s en mÃ©moire que pendant son fonctionnement. Ouvrir le fichier dans un
Ã©diteur de texte ou dÃ©compresser le programme ne les rÃ©vÃ¨le pas.

---

## 5. Limites honnÃªtes

ÃŠtre franc avec vous vaut mieux qu'une belle page de marketing.

| | |
|---|---|
| **Pas de signature numÃ©rique** | Windows vous avertit au premier lancement : `Informations complÃ©mentaires â†’ ExÃ©cuter quand mÃªme`. |
| **La base de donnÃ©es n'est pas chiffrÃ©e** | Vos documents sont dans un fichier de votre dossier utilisateur. Quiconque accÃ¨de Ã  votre compte Windows peut le lire. |
| **Il cite, il ne raisonne pas** | Il trouve et rÃ©pÃ¨te ce que disent vos documents. Il ne calcule ni ne dÃ©duit rien. |
| **Les rÃ©ponses peuvent Ãªtre fausses** | Le modÃ¨le est petit exprÃ¨s. VÃ©rifiez toujours les passages citÃ©s. |
| **Un utilisateur Ã  la fois** | PensÃ© pour une personne et un PC. Ce n'est pas un serveur partagÃ©. |

---

## 6. Questions frÃ©quentes

**Ai-je besoin d'une connexion internet ?**
Seulement pendant l'installation et le tÃ©lÃ©chargement des modÃ¨les. Ensuite vous pouvez vous
dÃ©connecter et cela continue de fonctionner.

**Est-ce que quelque chose est envoyÃ© Ã  une entreprise ?**
Non. Le programme en est physiquement incapable : la seule destination rÃ©seau qu'il accepte
est `127.0.0.1`. La section 4.1 explique pourquoi, et explique aussi comment le vÃ©rifier.

**Comment le dÃ©sinstaller ?**
ParamÃ¨tres â†’ Applications installÃ©es â†’ minikit-ai â†’ DÃ©sinstaller. Vos documents sont
conservÃ©s, pas supprimÃ©s : si vous rÃ©installez, vous ne perdez pas l'index.

**Mon ordinateur est lent. Que faire ?**
Fermez les autres programmes pendant que vous posez des questions. La premiÃ¨re rÃ©ponse est
toujours la plus lente.

**Quelque chose a Ã©chouÃ©.**
Ouvrez l'Invite de commandes et tapez `minikit-ai doctor`. Il affiche exactement ce qui
manque.

---

## 7. Pour les dÃ©veloppeurs

Le code source n'est pas dans ce dÃ©pÃ´t. Voir [SECURITY.md](SECURITY.md) pour signaler une
vulnÃ©rabilitÃ© et [LICENSE](LICENSE) pour les conditions d'utilisation.

**Merci de l'utiliser.**
