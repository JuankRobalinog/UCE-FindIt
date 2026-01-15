# Usa una imagen ligera de Node
FROM node:18-alpine

# Directorio de trabajo
WORKDIR /app

# Copiamos archivos de dependencias
COPY package*.json ./

# Instalamos solo lo necesario para producción
RUN npm install --only=production

# Copiamos el código del microservicio
COPY . .

# Exponemos el puerto (cambia según el servicio)
EXPOSE 3005

CMD ["npm", "start"]