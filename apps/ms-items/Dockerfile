FROM node:18-alpine
WORKDIR /app

COPY package*.json ./
COPY turbo.json ./

RUN npm install

COPY . .

# Filtro para ITEMS
RUN npm run build --filter=ms-items

# Ruta para ITEMS
CMD ["node", "apps/ms-items/dist/index.js"]