FROM node:18

# Install pnpm globally
RUN npm install -g pnpm

# Set working directory to the root of the monorepo (relative to build context)
WORKDIR /app

# Copy everything from the repo root (since Docker build context will be /app/apps/webapp)
COPY ../../ .

# Install dependencies across the monorepo
RUN pnpm install

# Build only the webapp
RUN pnpm --filter webapp build

# Expose port used by the webapp
EXPOSE 3000

# Set working directory to the webapp
WORKDIR /app/apps/webapp

# Start the app
CMD ["pnpm", "start"]
