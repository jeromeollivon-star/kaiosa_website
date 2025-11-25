# 📦 Configuration GitHub Pages - KAIOSA

## ✨ Ce qui a été ajouté

### 🔧 Fichiers de Configuration

```
kaiosa_website/
├── .github/
│   └── workflows/
│       └── deploy.yml          ← Déploiement automatique
├── .gitignore                  ← Fichiers à ignorer
├── deploy-github.sh            ← Script de déploiement
└── ... (reste du projet)
```

### 🚀 Workflow GitHub Actions

Le fichier `.github/workflows/deploy.yml` fait automatiquement :

1. ✅ Installe Flutter
2. ✅ Installe les dépendances (`flutter pub get`)
3. ✅ Compile le site web (`flutter build web`)
4. ✅ Déploie sur la branche `gh-pages`

**Déclencheur** : À chaque push sur la branche `main`

### 🎯 Base Href Configuré

Le site est configuré pour fonctionner sur :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

Si tu changes le nom du repo, modifie ligne 25 de `deploy.yml` :
```yaml
--base-href "/NOUVEAU_NOM/"
```

## 🚀 Déploiement en 5 Étapes

### 1️⃣ Créer le Repo GitHub

- Va sur https://github.com/new
- Nom : `kaiosa_website`
- Type : **Public**
- Clique **Create**

### 2️⃣ Déployer avec le Script

```bash
cd kaiosa_website
./deploy-github.sh
```

Ou manuellement :
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git
git push -u origin main
```

### 3️⃣ Attendre le Build

1. Va dans l'onglet **Actions** de ton repo
2. Le workflow "Deploy to GitHub Pages" se lance automatiquement
3. Attends qu'il soit vert (✅) (~3 minutes)

### 4️⃣ Activer GitHub Pages

1. Va dans **Settings** → **Pages**
2. Source : Branch `gh-pages`, Folder `/ (root)`
3. Clique **Save**

### 5️⃣ Visiter le Site

Attends 1-2 minutes, puis :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

## 🔄 Mises à Jour

Pour mettre à jour le site :

```bash
# Modifie tes fichiers
# Puis :
git add .
git commit -m "Description des changements"
git push
```

Le site se met à jour automatiquement en ~3 minutes ! ⚡

## 📊 Suivre les Déploiements

Onglet **Actions** de ton repo :
- 🟢 Vert = Déploiement réussi
- 🔴 Rouge = Erreur (voir les logs)
- 🟡 Jaune = En cours

## 🎨 Personnaliser le Domaine

### Option 1 : Nom de Repo Personnalisé

Pour avoir `username.github.io` (sans `/kaiosa_website/`) :

1. Renomme le repo en `TON_USERNAME.github.io`
2. Modifie `deploy.yml` ligne 25 :
   ```yaml
   --base-href "/"
   ```

### Option 2 : Domaine Custom (kaiosa.com)

1. Achète un domaine
2. Configure DNS avec un CNAME :
   ```
   www → TON_USERNAME.github.io
   ```
3. Dans Settings → Pages, ajoute le custom domain
4. Active HTTPS (automatique)

## ⚠️ Troubleshooting

### Page blanche après déploiement

**Cause** : Base href incorrect

**Solution** :
```yaml
# Dans deploy.yml ligne 25
--base-href "/kaiosa_website/"  # Doit correspondre au nom du repo
```

### Workflow en erreur

**Causes communes** :
- Nom de branche : Change `main` → `master` si nécessaire (ligne 5 de deploy.yml)
- Erreur de build Flutter : Vérifie les logs dans Actions

**Solution** :
1. Clique sur le workflow rouge
2. Lis l'erreur
3. Corrige et push à nouveau

### 404 sur les routes

**Cause** : Navigation Flutter non gérée par GitHub Pages

**Solution** : Créer un `404.html`

Ajoute dans `deploy.yml` après la ligne 23 :
```yaml
- name: Copy 404
  run: cp build/web/index.html build/web/404.html
```

### Authentication failed

**Solution** : Utilise un Personal Access Token

1. https://github.com/settings/tokens
2. Generate new token (classic)
3. Coche `repo`
4. Utilise-le comme mot de passe

## 📚 Documentation Utile

- **GitHub Pages** : https://docs.github.com/pages
- **GitHub Actions** : https://docs.github.com/actions
- **Flutter Web** : https://flutter.dev/web

## 🎯 Checklist Complète

- [ ] Repo GitHub créé (public)
- [ ] `.github/workflows/deploy.yml` présent
- [ ] `.gitignore` présent
- [ ] Git initialisé localement
- [ ] Premier push effectué
- [ ] Workflow exécuté (Actions)
- [ ] Branche `gh-pages` créée
- [ ] GitHub Pages activé (Settings)
- [ ] Site accessible à l'URL

## 🌟 Résultat

Ton site KAIOSA sera automatiquement déployé sur :

```
https://TON_USERNAME.github.io/kaiosa_website/
```

Chaque modification push = Mise à jour automatique ! 🚀

---

**Guides rapides :**
- 📖 Détaillé : `GITHUB_PAGES_SETUP.md`
- ⚡ Ultra-simple : `DEPLOIEMENT_SIMPLE.md`

**Questions ?**
📧 contact@kaiosa.com
