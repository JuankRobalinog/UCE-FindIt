FROM node:18-alpine
WORKDIR /app

# Copiamos archivos de la raíz para las dependencias
COPY package*.json ./
COPY turbo.json ./

# Instalamos dependencias (esto instalará Express)
RUN npm install

# Copiamos todo el código del proyecto
COPY . .

# ¡CAMBIO CLAVE!: No usamos 'npm run build' porque no existe en tu JSON.
# Simplemente verificamos que el archivo está en su lugar y lo lanzamos.
# Según tu captura, el archivo está en: apps/ms-gateway/index.js
CMD ["node", "apps/ms-gateway/index.js"]