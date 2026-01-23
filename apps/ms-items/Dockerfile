FROM node:18-alpine
WORKDIR /app

# Copiamos los archivos de la raíz
COPY package*.json ./
COPY turbo.json ./

# Instalamos dependencias
RUN npm install

# Copiamos todo el código
COPY . .

# CONSTRUCCIÓN DIRECTA (Sin depender de filtros complejos)
RUN cd apps/ms-items && npm install && npm run build

# EJECUCIÓN (Apunta directamente al archivo generado)
CMD ["node", "apps/ms-items/dist/index.js"]