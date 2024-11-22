# Build stage
FROM node:16-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Build Tailwind CSS
RUN npx tailwindcss -i ./src/input.css -o ./dist/output.css --minify

# Production stage
FROM nginx:alpine

# Copy HTML files
COPY --from=builder /app/*.html /usr/share/nginx/html/
# Copy CSS
COPY --from=builder /app/dist /usr/share/nginx/html/dist/
# Copy JS
COPY --from=builder /app/js /usr/share/nginx/html/js
# Copy images if any
COPY --from=builder /app/img /usr/share/nginx/html/img

# Nginx configuration untuk SPA (Single Page Application)
RUN echo 'server { \
    listen 80; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
