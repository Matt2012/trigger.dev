# Use official Node.js 18 base image
FROM node:18

# Install pnpm globally
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy all source files
COPY . .

# Install dependencies across the monorepo
RUN pnpm install

# Build only the webapp
RUN pnpm --filter webapp build

# Expose the port used by the webapp
EXPOSE 3000

# Set working directory to the webapp
WORKDIR /app/apps/webapp

# Start the app (use dev if you want live logs during debugging)
CMD ["pnpm", "start"]
