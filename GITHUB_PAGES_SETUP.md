# 🚀 Déploiement sur GitHub Pages - Guide Express

## ⚡ Setup Ultra-Rapide (5 minutes)

### 1️⃣ Créer le Repo GitHub

```bash
# Sur GitHub.com, créer un nouveau repository nommé "kaiosa_website"
# ⚠️ Important : Cocher "Public" (GitHub Pages gratuit nécessite un repo public)
```

### 2️⃣ Initialiser Git Localement

```bash
cd kaiosa_website

# Initialiser Git
git init

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "🎉 Initial commit - KAIOSA Flutter website"

# Lier au repo GitHub (remplace TON_USERNAME)
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git

# Pousser vers GitHub
git push -u origin main
```

> **Note** : Si ta branche s'appelle `master` au lieu de `main`, remplace dans le workflow

### 3️⃣ Activer GitHub Pages

1. Va sur ton repo : `https://github.com/TON_USERNAME/kaiosa_website`
2. Clique sur **Settings** (en haut)
3. Dans le menu de gauche, clique sur **Pages**
4. Dans **Source**, sélectionne :
   - Branch: `gh-pages`
   - Folder: `/ (root)`
5. Clique sur **Save**

### 4️⃣ C'est Tout ! 🎉

Attends 2-3 minutes, puis visite :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

## 🔄 Workflow Automatique

Chaque fois que tu push sur `main`, GitHub Actions :
1. ✅ Installe Flutter
2. ✅ Compile ton app en web
3. ✅ Déploie automatiquement sur GitHub Pages

## 📝 Commandes Git Utiles

### Après des Modifications

```bash
# Voir les changements
git status

# Ajouter les modifications
git add .

# Commit
git commit -m "✨ Description de tes changements"

# Pousser vers GitHub
git push

# → Le site se met à jour automatiquement !
```

### Créer un Commit Propre

```bash
git add .
git commit -m "🎨 Mise à jour des couleurs"
git push
```

## 🎯 Personnaliser le Nom de Domaine

### Option 1 : Sous-domaine GitHub (Gratuit)

Par défaut : `TON_USERNAME.github.io/kaiosa_website/`

### Option 2 : Domaine Personnalisé (Ex: kaiosa.com)

1. Achète un domaine (ex: Gandi, OVH, Namecheap)
2. Dans les DNS, ajoute un CNAME :
   ```
   www CNAME TON_USERNAME.github.io.
   ```
3. Dans GitHub Pages settings, ajoute ton domaine custom
4. Attends la propagation DNS (quelques heures)

Ton site sera sur : `www.kaiosa.com`

## 🔧 Modifier le Base Href

Si tu changes le nom du repo, édite `.github/workflows/deploy.yml` ligne 25 :

```yaml
run: flutter build web --release --base-href "/NOUVEAU_NOM_REPO/"
```

## ⚠️ Troubleshooting

### Problème : Page blanche

**Solution** : Vérifie le base-href dans le workflow

```yaml
# Doit correspondre au nom de ton repo
--base-href "/kaiosa_website/"
```

### Problème : 404 sur les routes

**Solution** : Créer un fichier `404.html` qui redirige vers `index.html`

```bash
# Dans build/web/ après build
cp index.html 404.html
```

### Problème : Le workflow échoue

1. Va dans l'onglet **Actions** de ton repo
2. Clique sur le workflow en échec
3. Regarde les logs pour voir l'erreur

**Erreur commune** : Branch name
- Le workflow utilise `main`
- Si tu es sur `master`, change ligne 5 du workflow

### Problème : GitHub Pages n'est pas activé

**Solution** :
1. Assure-toi que le repo est **public**
2. Va dans Settings → Pages
3. Vérifie que la branche `gh-pages` existe (elle se crée au premier push)

## 🎨 Structure des Fichiers Ajoutés

```
kaiosa_website/
├── .github/
│   └── workflows/
│       └── deploy.yml       ← Workflow de déploiement
├── .gitignore              ← Fichiers à ignorer par Git
└── ... (reste du projet)
```

## 📊 Suivre les Déploiements

Onglet **Actions** → Voir l'historique des déploiements
- ✅ Vert = Succès
- ❌ Rouge = Échec (voir les logs)
- 🟡 Jaune = En cours

## 🚀 Commandes Récapitulatives

```bash
# Setup initial (une seule fois)
cd kaiosa_website
git init
git add .
git commit -m "🎉 Initial commit"
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git
git push -u origin main

# Après chaque modification
git add .
git commit -m "✨ Description"
git push

# Forcer un redéploiement
git commit --allow-empty -m "🔄 Redeploy"
git push
```

## ⏱️ Temps de Déploiement

- **Build** : ~2-3 minutes
- **Déploiement** : ~30 secondes
- **Total** : ~3-4 minutes après le push

## 🎯 URLs Importantes

Remplace `TON_USERNAME` par ton username GitHub :

- **Repo** : `https://github.com/TON_USERNAME/kaiosa_website`
- **Site** : `https://TON_USERNAME.github.io/kaiosa_website/`
- **Actions** : `https://github.com/TON_USERNAME/kaiosa_website/actions`
- **Settings** : `https://github.com/TON_USERNAME/kaiosa_website/settings/pages`

## ✅ Checklist de Déploiement

- [ ] Repo GitHub créé (public)
- [ ] Git initialisé localement
- [ ] Fichiers commit et push
- [ ] Workflow exécuté (onglet Actions)
- [ ] Branche `gh-pages` créée
- [ ] GitHub Pages activé (Settings → Pages)
- [ ] Site accessible à l'URL

## 🎉 Résultat Final

Ton site KAIOSA sera en ligne sur :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

**Totalement gratuit et automatique !** ✨

---

**Questions ?** 
📧 contact@kaiosa.com

**Documentation GitHub Pages :**
📖 https://docs.github.com/en/pages
