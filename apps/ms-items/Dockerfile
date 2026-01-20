FROM node:18-alpine
WORKDIR /app

# 1. Copiamos los archivos de la raíz necesarios para instalar dependencias
COPY package*.json ./
COPY turbo.json ./ 

# 2. Instalamos dependencias (esto detectará los workspaces)
RUN npm install

# 3. Copiamos el código de ESTE microservicio específicamente
# Asegúrate de que el contexto del build sea la raíz del monorepo
COPY . .

# 4. Compilamos el microservicio (ajusta el nombre según tu package.json)
RUN npx turbo run build --filter=ms-users

# 5. ¡ESTA ES LA RUTA CORRECTA! 
# Apuntamos a donde Turbo o NestJS dejan el archivo final
CMD ["node", "apps/ms-users/dist/index.js"]