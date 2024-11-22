# Gunakan Node.js versi 14 sebagai base image
FROM node:14

# Set working directory
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua file aplikasi
COPY . .

# Jalankan proses build untuk menghasilkan folder 'dist'
RUN npm run build

# Expose port yang digunakan aplikasi
EXPOSE 3000

# Jalankan aplikasi
CMD ["npm", "start"]
