FROM node:18-alpine
WORKDIR /app

# Copiamos archivos base de la raíz
COPY package*.json ./
COPY turbo.json ./

# Instalamos todas las dependencias del monorepo
RUN npm install

# Copiamos el resto del código
COPY . .

# Compilamos específicamente este microservicio
RUN npm run build --filter=ms-users

# Verificamos que el archivo existe y lo ejecutamos
# NOTA: Si usas NestJS, la ruta suele ser apps/ms-users/dist/main.js
CMD ["node", "apps/ms-users/dist/index.js"]