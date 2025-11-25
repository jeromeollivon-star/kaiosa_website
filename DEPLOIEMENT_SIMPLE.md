# 🚀 Déployer KAIOSA sur GitHub Pages

## 🎯 Méthode Ultra-Simple (Copy-Paste)

### Étape 1 : Créer le Repo sur GitHub

1. Va sur https://github.com/new
2. Nom du repo : **kaiosa_website**
3. Coche **Public**
4. Clique **Create repository**

### Étape 2 : Ouvrir le Terminal

```bash
cd kaiosa_website
```

### Étape 3 : Lancer le Script

```bash
./deploy-github.sh
```

Le script te demandera ton username GitHub, puis fera tout automatiquement ! ✨

### Étape 4 : Activer GitHub Pages

1. Va sur ton repo : `https://github.com/TON_USERNAME/kaiosa_website`
2. Clique **Settings** (en haut)
3. Clique **Pages** (menu gauche)
4. Dans **Source**, sélectionne :
   - Branch: **gh-pages**
   - Folder: **/ (root)**
5. Clique **Save**

### Étape 5 : Visite Ton Site ! 🎉

Attends 2-3 minutes, puis :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

---

## 🔧 Méthode Manuelle (Alternative)

Si le script ne marche pas :

```bash
cd kaiosa_website

# 1. Init Git
git init

# 2. Config (remplace par tes infos)
git config user.name "Ton Nom"
git config user.email "ton@email.com"

# 3. Add & Commit
git add .
git commit -m "Initial commit"

# 4. Link à GitHub (remplace TON_USERNAME)
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git

# 5. Push
git push -u origin main
```

Puis active GitHub Pages comme à l'étape 4 ci-dessus.

---

## 📝 Pour Mettre à Jour le Site Plus Tard

```bash
# Dans le dossier kaiosa_website
git add .
git commit -m "Mise à jour"
git push
```

Le site se met à jour automatiquement en 3 minutes ! ⚡

---

## ⚠️ Si ça ne Marche Pas

### Problème : Authentication failed

**Solution** : Crée un Personal Access Token

1. Va sur https://github.com/settings/tokens
2. Clique **Generate new token (classic)**
3. Coche **repo**
4. Copie le token
5. Utilise-le comme mot de passe quand Git demande

### Problème : Page blanche

**Solution** : Vérifie le base-href

Dans `.github/workflows/deploy.yml` ligne 25 :
```yaml
--base-href "/kaiosa_website/"
```

Doit correspondre au nom exact de ton repo.

### Problème : gh-pages n'existe pas

**Solution** : 

1. Attends que le workflow se termine (onglet Actions)
2. Rafraîchis la page Settings → Pages
3. La branche gh-pages apparaîtra

---

## 🎯 Résumé en 3 Commandes

```bash
cd kaiosa_website
./deploy-github.sh
# Puis active Pages dans Settings
```

**C'est tout ! 🎉**

Ton site sera sur :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

---

**Questions ?**
📧 contact@kaiosa.com
