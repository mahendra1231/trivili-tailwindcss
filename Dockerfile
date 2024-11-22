# Use Node.js Alpine-based image
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Expose port 3000 (sesuai dengan port yang digunakan di aplikasi)
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
