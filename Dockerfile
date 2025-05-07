# Start from a Node.js base image
FROM node:18

# Install pnpm globally
RUN npm install -g pnpm

# Create app directory
WORKDIR /app

# Copy the entire repo
COPY . .

# Install dependencies
RUN pnpm install

# Build the webapp
RUN pnpm --filter webapp build

# Set working directory for webapp
WORKDIR /app/apps/webapp

# Start the app
CMD ["pnpm", "start"]
