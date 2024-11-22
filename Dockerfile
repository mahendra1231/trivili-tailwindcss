# Gunakan versi Node.js yang lebih baru
FROM node:18

# Setel direktori kerja
WORKDIR /app

# Salin package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Perbarui NPM sebelum instalasi dependensi
RUN npm install -g npm@latest

# Instal dependensi
RUN npm install

# Salin seluruh file proyek ke container
COPY . .

# Perintah default
CMD ["npm", "start"]
