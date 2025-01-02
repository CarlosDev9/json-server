# Usa una imagen base oficial de Node.js
FROM node:16

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de dependencias package.json y package-lock.json (si los tienes)
COPY package*.json ./

# Instala las dependencias del proyecto (incluido json-server)
RUN npm install

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Expone el puerto en el que corre json-server
EXPOSE 3000

# Comando para ejecutar json-server con el archivo db.json
CMD ["npx", "json-server", "--watch", "src/data/db.json", "--port", "3000"]
