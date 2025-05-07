FROM node:18

RUN npm install -g pnpm

WORKDIR /app
COPY . .

# Optional: show what's there for debug
RUN ls -la && ls -la internal-packages && ls -la apps

RUN pnpm install --frozen-lockfile

WORKDIR /app/internal-packages/database
RUN pnpm exec prisma generate
RUN pnpm exec prisma migrate deploy

WORKDIR /app
RUN pnpm build

WORKDIR /app/apps/webapp
CMD ["pnpm", "start"]
