# Étape 1 – Build Vue.js
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Étape 2 – Serveur NGINX
FROM nginx:stable-alpine AS runtime

# Copier le build de Vue vers nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Supprimer la config par défaut si nécessaire
RUN rm /etc/nginx/conf.d/default.conf

# Copier ta propre config nginx (optionnel)
# COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
