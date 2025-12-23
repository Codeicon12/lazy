FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Create uploads directory for file uploads
RUN mkdir -p backend/uploads

# Create logs directory
RUN mkdir -p backend/logs

# Expose the port the app runs on
EXPOSE $PORT 3000

# Start the application
CMD ["npm", "run", "start"]