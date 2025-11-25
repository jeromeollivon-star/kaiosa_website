# ⚡ Quick Start GitHub Pages

## 🎯 3 Méthodes de Déploiement

Choisis celle qui te convient :

---

## Méthode 1 : Script Automatique (Recommandé) ⭐

### Windows
1. Double-clique sur `deploy-github.bat`
2. Entre ton username GitHub
3. Suis les instructions

### Mac/Linux
```bash
cd kaiosa_website
./deploy-github.sh
```

---

## Méthode 2 : Commandes Manuelles 💻

```bash
cd kaiosa_website

# Crée le repo sur GitHub AVANT :
# https://github.com/new
# Nom : kaiosa_website
# Type : Public

# Puis :
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git
git push -u origin main
```

---

## Méthode 3 : GitHub Desktop (Super Simple) 🖱️

1. Télécharge **GitHub Desktop** : https://desktop.github.com
2. Ouvre l'app
3. **File** → **Add Local Repository**
4. Choisis le dossier `kaiosa_website`
5. Clique **Publish repository**
6. Nom : `kaiosa_website`, Public ✓
7. Clique **Publish**

✅ C'est fait !

---

## Après le Push (Obligatoire) ⚙️

Quelle que soit la méthode, tu DOIS activer GitHub Pages :

1. Va sur https://github.com/TON_USERNAME/kaiosa_website
2. **Settings** → **Pages**
3. Source :
   - Branch : **gh-pages**
   - Folder : **/ (root)**
4. **Save**

Attends 3 minutes → Visite :
```
https://TON_USERNAME.github.io/kaiosa_website/
```

---

## 🐛 Erreurs ?

**Fenêtre se ferme** → Lis `DEBOGAGE.md`

**Git introuvable** → Installe : https://git-scm.com

**Authentication failed** → Utilise un token :
1. https://github.com/settings/tokens
2. Generate new token (classic)
3. Coche "repo"
4. Utilise comme mot de passe

**Repo existe pas** → Crée-le sur https://github.com/new

---

## 📝 Mise à Jour Ultérieure

```bash
git add .
git commit -m "Update"
git push
```

Site mis à jour automatiquement ! ⚡

---

## 🎯 Résumé Ultra-Rapide

```bash
# Sur https://github.com/new → Créer "kaiosa_website" (public)

cd kaiosa_website
git init
git add .
git commit -m "Initial"
git remote add origin https://github.com/TON_USERNAME/kaiosa_website.git
git push -u origin main

# Settings → Pages → gh-pages → Save
# ✅ Ton site : https://TON_USERNAME.github.io/kaiosa_website/
```

**C'est tout !** 🎉
