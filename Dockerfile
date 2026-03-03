# Use lightweight Node image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy rest of application
COPY . .

# Expose application port
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]