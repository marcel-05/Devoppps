########################################
# Étape 1 : build de l’application Vue #
########################################
# Image officielle Node (légère, Alpine)
FROM node:18-apline AS builder

# Crée le dossier de travail
WORKDIR /app

# Copie package.json / package-lock.json (ou pnpm-lock.yaml / yarn.lock)
COPY package*.json ./

# Installation des dépendances
RUN npm ci           # plus rapide / fiable que npm install

# Copie du reste du projet
COPY . .

# Construction de la version de production
RUN npm run build           # génère le dossier dist/ (vite) ou build/ (vue-cli)

########################################
# Étape 2 : image runtime super légère #
########################################
FROM nginx:stable-alpine

# Copie des fichiers compilés dans le dossier servi par Nginx
COPY --from=builder /app/dist /usr/share/nginx/html
#    ^^^ adapte à /app/build si tu utilises vue-cli

# Optionnel : remplace la conf Nginx si besoin
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose le port web standard
EXPOSE 80

# Lance Nginx (commandé par l’image de base → inutile de redéfinir CMD)
