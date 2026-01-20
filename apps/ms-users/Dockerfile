FROM node:18-alpine
WORKDIR /app

COPY package*.json ./
COPY turbo.json ./

RUN npm install

COPY . .

# Filtro para USERS
RUN npm run build --filter=ms-users

# Ruta para USERS
CMD ["node", "apps/ms-users/dist/index.js"]