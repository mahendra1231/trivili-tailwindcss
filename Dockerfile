# Pilih base image sesuai dengan project Anda
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Expose port (sesuaikan dengan port aplikasi Anda)
EXPOSE 3000

# Command untuk menjalankan aplikasi
CMD ["npm", "start"]
