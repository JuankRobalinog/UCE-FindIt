FROM node:18-alpine
WORKDIR /app

# Copiamos archivos base de la raíz
COPY package*.json ./
COPY turbo.json ./

# Instalamos todas las dependencias del monorepo
RUN npm install

# Copiamos el resto del código
COPY . .

# Compilamos específicamente el GATEWAY
RUN npm run build --filter=ms-gateway

# Ejecutamos el archivo generado en la carpeta del gateway
CMD ["node", "apps/ms-gateway/dist/index.js"]