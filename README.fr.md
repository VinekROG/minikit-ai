# minikit-ai

> Posez des questions à vos propres documents. Rien n'est envoyé. Rien ne quitte votre ordinateur.

[English](README.md) · [Español](README.es.md) · [Français](README.fr.md) · [Português](README.pt.md) · [中文](README.zh.md) · [हिन्दी](README.hi.md) · [العربية](README.ar.md)

**Windows 10/11** · sans droits administrateur · un seul installeur · fonctionne hors ligne.

---

## 1. Qu'est-ce que c'est

Montrez-lui un dossier de documents. Il les lit, les retient, et y répond en langage
courant — en vous montrant les passages exacts qu'il a utilisés.

- **PDF**, **Word (.docx)**, **Markdown** et **texte brut**
- Tout se passe sur votre machine : les modèles d'IA, la base de données, le panneau web
- Aucun compte, aucune clé d'API, aucun abonnement, aucune télémétrie

## 2. Installation en quatre étapes

### Étape 1 — Installer Ollama

Ollama est le moteur libre et open source qui exécute les modèles d'IA sur votre propre
machine.

1. Allez sur **<https://ollama.com/download>**
2. Téléchargez la version Windows et installez-la
3. Laissez-la installée. Vous n'avez pas encore besoin de la lancer.

### Étape 2 — Télécharger les deux modèles d'IA

Ouvrez l'**Invite de commandes** (touche `Win`, tapez `cmd`, appuyez sur Entrée) et
copiez-collez ces deux lignes, une par une :

```
ollama pull nomic-embed-text
ollama pull qwen2.5:0.5b
```

- `nomic-embed-text` (274 Mo) transforme le texte en nombres pour que le programme puisse
  le rechercher
- `qwen2.5:0.5b` (400 Mo) rédige les réponses

Ils sont volontairement minuscules : le but est que ça marche sur un vieux PC bon marché.
Si vous avez plus de mémoire et voulez de meilleures réponses, vous pourrez passer plus
tard à `qwen2.5:3b`.

### Étape 3 — Lancer l'installeur

1. Allez sur **<https://github.com/VinekROG/minikit-ai/releases/latest>**
2. Téléchargez `minikit-ai-1.0.0-beta-setup.exe` (environ 4 Mo)
3. Double-cliquez
4. Windows affichera un avertissement bleu. C'est normal — voir la note ci-dessous.
5. Cliquez sur **Informations complémentaires → Exécuter quand même**
6. L'installeur ne demande jamais les droits administrateur

> **À propos de l'avertissement bleu :** Windows l'affiche parce que le fichier n'a pas de
> signature numérique. L'auteur ne possède pas de certificat de signature. L'avertissement
> dit « application non reconnue », pas « virus ». Une fois installé, ce message n'apparaît
> qu'une seule fois.

### Étape 4 — Lancer le programme

1. Appuyez sur la touche Windows et tapez **minikit-ai**
2. Appuyez sur Entrée
3. Une petite fenêtre noire s'ouvre et votre navigateur s'ouvre tout seul
4. C'est le programme. La fenêtre noire doit rester ouverte.

---

## 3. Utilisation

1. **Ajoutez des documents.** Glissez un fichier dans la fenêtre, ou tapez le chemin d'un
   dossier comme `C:\Users\Vous\Documents\contrats` et appuyez sur *Indexer*.
2. **Posez une question.** Écrivez-la dans la zone de droite, dans la langue de votre choix.
3. **Lisez les sources.** La réponse liste les passages utilisés, pour que vous puissiez
   vérifier.

La première réponse prend du temps (30 à 90 secondes sur un vieux PC) car le modèle est
chargé en mémoire pour la première fois. Les suivantes sont bien plus rapides.

Formats pris en charge : `.pdf` `.docx` `.txt` `.md`

---

## 4. Pourquoi vos documents restent privés

C'est la partie importante, alors voici exactement ce que fait le programme : pas une
promesse, une description du mécanisme.

### 4.1 Le réseau est éteint pour de vrai

Toutes les connexions sortantes du programme passent par une seule porte. Cette porte
n'autorise qu'une seule destination : `127.0.0.1`, votre propre machine. Rien d'autre. Ni
une adresse web, ni un nom de domaine, ni un autre poste de votre réseau.

Si quoi que ce soit tente de sortir — une erreur de programmation, un fichier corrompu,
une instruction malveillante cachée dans l'un de vos propres documents — trois choses se
produisent en même temps :

1. La connexion est refusée.
2. Les données des documents présentes en mémoire sont écrasées par des zéros.
3. La tentative est consignée dans un journal que vous pouvez lire dans le panneau.

Vous pouvez le vérifier vous-même à tout moment. Appuyez sur le bouton **Exécuter
l'autotest** du panneau : il tente délibérément d'atteindre `1.1.1.1` et `example.com` et
vous montre les refus.

### 4.2 Personne ne peut utiliser votre copie à distance

Le panneau est lié à votre machine, exige un mot de passe aléatoire généré à chaque
démarrage, rejette les requêtes dont l'adresse n'est pas celle de votre ordinateur, et ne
répond pas si quelqu'un envoie trop de requêtes d'un coup. Une page web ouverte dans un
autre onglet ne peut pas lui parler.

---

## 5. Limites honnêtes

Être franc avec vous vaut mieux qu'une belle page de marketing.

| | |
|---|---|
| **Pas de signature numérique** | Windows vous avertit au premier lancement : `Informations complémentaires → Exécuter quand même`. |
| **La base de données n'est pas chiffrée** | Vos documents sont dans un fichier de votre dossier utilisateur. Quiconque accède à votre compte Windows peut le lire. |
| **Il cite, il ne raisonne pas** | Il trouve et répète ce que disent vos documents. Il ne calcule ni ne déduit rien. |
| **Les réponses peuvent être fausses** | Le modèle est petit exprès. Vérifiez toujours les passages cités. |
| **Un utilisateur à la fois** | Pensé pour une personne et un PC. Ce n'est pas un serveur partagé. |

---

## 6. Questions fréquentes

**Ai-je besoin d'une connexion internet ?**
Seulement pendant l'installation et le téléchargement des modèles. Ensuite vous pouvez vous
déconnecter et cela continue de fonctionner.

**Est-ce que quelque chose est envoyé à une entreprise ?**
Non. Le programme en est physiquement incapable : la seule destination réseau qu'il accepte
est `127.0.0.1`. La section 4.1 explique pourquoi, et explique aussi comment le vérifier.

**Comment le désinstaller ?**
Paramètres → Applications installées → minikit-ai → Désinstaller. Vos documents sont
conservés, pas supprimés : si vous réinstallez, vous ne perdez pas l'index.

**Mon ordinateur est lent. Que faire ?**
Fermez les autres programmes pendant que vous posez des questions. La première réponse est
toujours la plus lente.

**Quelque chose a échoué.**
Ouvrez l'Invite de commandes et tapez `minikit-ai doctor`. Il affiche exactement ce qui
manque.

---

## 7. Pour les développeurs

Voir [SECURITY.md](SECURITY.md) pour signaler une vulnérabilité et [LICENSE](LICENSE) pour les
conditions d'utilisation.

**Merci de l'utiliser.**
