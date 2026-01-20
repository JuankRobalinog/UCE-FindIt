FROM node:18-alpine
WORKDIR /app

# Copiamos solo lo necesario para instalar (desde la raíz)
COPY package*.json ./
COPY turbo.json ./

RUN npm install

# Copiamos todo el código
COPY . .

# ¡PASO VITAL! Compilamos el código
RUN npm run build

# Ajustamos el comando para que busque el archivo generado en 'dist'
# Si tu build genera archivos en apps/ms-users/dist/index.js, esta es la ruta:
CMD ["node", "apps/ms-users/dist/index.js"]