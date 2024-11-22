# Build stage
FROM node:16-alpine as build-stage

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Build aplikasi
RUN npm run build

# Production stage
FROM nginx:stable-alpine as production-stage

# Copy hasil build ke nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copy konfigurasi nginx jika ada
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
