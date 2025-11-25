# 🔧 Débogage - Erreurs de Déploiement

## 🐛 Problèmes Courants et Solutions

### 1. La fenêtre se ferme immédiatement

**Cause** : Erreur dans le script

**Solution** :

**Sur Windows** : Double-clique sur `deploy-github.bat` au lieu de `deploy-github.sh`

**Sur Mac/Linux** : Lance depuis le terminal :
```bash
cd kaiosa_website
./deploy-github.sh
```

Si ça ne marche toujours pas :
```bash
bash deploy-github.sh
```

---

### 2. "git: command not found"

**Cause** : Git n'est pas installé

**Solution** :

**Windows** :
1. Télécharge : https://git-scm.com/download/win
2. Installe avec les options par défaut
3. Redémarre le terminal

**Mac** :
```bash
# Installe Xcode Command Line Tools
xcode-select --install
```

**Linux** :
```bash
# Ubuntu/Debian
sudo apt-get install git

# Fedora
sudo dnf install git
```

---

### 3. "Permission denied (publickey)"

**Cause** : Authentification SSH non configurée

**Solution** : Utilise HTTPS avec Personal Access Token

1. Va sur https://github.com/settings/tokens
2. Clique **Generate new token (classic)**
3. Coche **repo**
4. Copie le token (commence par `ghp_...`)
5. Quand Git demande le mot de passe, colle le token

**Ou configure SSH** :
```bash
# Génère une clé SSH
ssh-keygen -t ed25519 -C "ton@email.com"

# Copie la clé publique
cat ~/.ssh/id_ed25519.pub

# Ajoute-la sur GitHub : https://github.com/settings/keys
```

---

### 4. "fatal: 'origin' does not appear to be a git repository"

**Cause** : Le repo GitHub n'existe pas

**Solution** :

1. Va sur https://github.com/new
2. Nom du repo : **kaiosa_website**
3. Type : **Public**
4. **Ne coche pas** "Initialize with README"
5. Clique **Create repository**
6. Relance le script

---

### 5. "nothing to commit, working tree clean"

**Cause** : Aucun fichier modifié

**Solution** : C'est normal ! Le script continue quand même.

Si tu veux forcer un nouveau commit :
```bash
git commit --allow-empty -m "Redeploy"
git push
```

---

### 6. "error: failed to push some refs"

**Cause** : La branche distante a des commits que tu n'as pas

**Solution** :

```bash
# Option 1 : Récupère les changements
git pull origin main --rebase
git push

# Option 2 : Force push (⚠️ écrase l'historique)
git push -f origin main
```

---

### 7. Workflow GitHub Actions échoue

**Cause** : Erreur dans la compilation Flutter

**Solution** :

1. Va dans l'onglet **Actions** de ton repo
2. Clique sur le workflow rouge
3. Lis les logs d'erreur

**Erreurs communes** :

#### "Flutter not found"
→ Le workflow est bon, attends qu'il s'installe

#### "Branch 'main' not found"
→ Ton repo utilise `master` au lieu de `main`

**Solution** : Édite `.github/workflows/deploy.yml` ligne 5 :
```yaml
branches:
  - master  # Change ici
```

#### "Permission denied"
→ GitHub Actions n'a pas les permissions

**Solution** :
1. Va dans **Settings** → **Actions** → **General**
2. Scroll vers le bas
3. Dans "Workflow permissions", coche **Read and write permissions**
4. **Save**

---

### 8. Page blanche après déploiement

**Cause** : Base href incorrect

**Solution** :

Le nom du repo dans le workflow doit correspondre exactement.

Édite `.github/workflows/deploy.yml` ligne 25 :
```yaml
--base-href "/kaiosa_website/"
```

Doit être **exactement** le nom de ton repo.

Si ton repo s'appelle différemment, change :
```yaml
--base-href "/TON_NOM_REPO/"
```

---

### 9. "gh-pages branch not found"

**Cause** : Le workflow n'a pas encore créé la branche

**Solution** :

1. Attends que le workflow se termine (onglet Actions)
2. Rafraîchis la page **Settings** → **Pages**
3. La branche `gh-pages` apparaîtra

---

### 10. "You don't have permission to push to this repository"

**Cause** : Tu n'es pas le propriétaire du repo

**Solution** :

Le repo doit être sur **ton compte GitHub**, pas ailleurs.

Si tu as forké un repo, renomme l'URL :
```bash
git remote set-url origin https://github.com/TON_USERNAME/kaiosa_website.git
```

---

## 🔍 Commandes de Diagnostic

### Vérifier Git
```bash
git --version
git config --list
```

### Vérifier les remotes
```bash
git remote -v
```

### Vérifier la branche actuelle
```bash
git branch
git status
```

### Voir l'historique
```bash
git log --oneline -5
```

---

## 🚀 Déploiement Manuel Étape par Étape

Si tous les scripts échouent, voici la méthode 100% manuelle :

```bash
# 1. Va dans le dossier
cd kaiosa_website

# 2. Init Git (si pas fait)
git init

# 3. Configure Git (remplace par tes infos)
git config user.name "Ton Nom"
git config user.email "ton@email.com"

# 4. Crée la branche main
git checkout -b main

# 5. Ajoute tous les fichiers
git add .

# 6. Commit
git commit -m "Initial commit"

# 7. Ajoute le remote (remplace TON_USERNAME)
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git

# 8. Push (utilise ton token comme mot de passe)
git push -u origin main
```

Ensuite, active GitHub Pages dans Settings → Pages.

---

## 📞 Besoin d'Aide ?

### Logs Utiles

Envoie ces infos si tu as besoin d'aide :

```bash
# Version de Git
git --version

# Status du repo
git status

# Remotes configurés
git remote -v

# Derniers commits
git log --oneline -3

# Erreur exacte
# Copie-colle le message d'erreur complet
```

### Ressources

- **Git** : https://git-scm.com/doc
- **GitHub** : https://docs.github.com
- **GitHub Actions** : https://docs.github.com/actions

---

## ✅ Checklist de Vérification

Avant de chercher l'erreur, vérifie :

- [ ] Git est installé (`git --version`)
- [ ] Repo GitHub existe et est public
- [ ] Tu es dans le bon dossier (`cd kaiosa_website`)
- [ ] Fichiers `.github/workflows/deploy.yml` et `.gitignore` présents
- [ ] Token GitHub créé (si authentification échoue)
- [ ] Nom du repo correspond dans `deploy.yml`

---

**Si rien ne marche**, contacte :
📧 contact@kaiosa.com

Avec :
- Système d'exploitation
- Version de Git
- Message d'erreur complet
- Captures d'écran si possible
