# Usa una imagen base oficial de Node.js
FROM node:current-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Instala json-server de forma global y asegúrate de que sea ejecutable
RUN npm install -g json-server && chmod +x /usr/local/bin/json-server

# Copia el resto de los archivos al contenedor
COPY . .

# Expone el puerto que utiliza json-server
EXPOSE 3000

# Comando para ejecutar json-server al iniciar el contenedor
CMD ["json-server", "--watch", "src/data/db.json", "--port", "3000"]
