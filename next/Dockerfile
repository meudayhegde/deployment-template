# Use Node.js as the base image for building
FROM node:24-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies first for efficient caching
COPY package.json package-lock.json ./  
RUN npm ci  

# Copy the rest of the application
COPY . .  

# Build the Next.js app
RUN npm run build  

# Install only production dependencies
RUN npm ci --omit=dev

# Use a minimal runtime image
FROM node:24-alpine AS runner

# Set working directory
WORKDIR /app

# Copy only necessary files from builder stage
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Set Next.js to production mode
ENV NODE_ENV=production
ENV PORT=3000

# Expose the port Next.js runs on
EXPOSE 3000

# Start the Next.js server
CMD ["/app/node_modules/.bin/next", "start"]