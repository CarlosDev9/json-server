# Usa una imagen base oficial de Node.js
FROM node:16

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de dependencias package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias del proyecto (incluido json-server)
RUN npm install

# Copia todos los archivos del proyecto al contenedor
COPY . .

# Instala json-server globalmente
RUN npm install -g json-server

# Expone el puerto en el que corre json-server
EXPOSE 3000

# Comando para ejecutar json-server con la ruta correcta al archivo db.json
CMD ["json-server", "--watch", "src/data/db.json", "--port", "3000"]
