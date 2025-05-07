FROM node:18

RUN npm install -g pnpm

WORKDIR /app

COPY . .

RUN pnpm install --frozen-lockfile

# ✅ Generate Prisma client for @trigger.dev/database
WORKDIR /app/internal-packages/database
RUN pnpm exec prisma generate

# (optional) Run migrations if Prisma schema is ready
# ENV DATABASE_URL=postgres://...
# RUN pnpm exec prisma migrate deploy

# 🔁 Go back to root and build everything
WORKDIR /app
RUN pnpm build

EXPOSE 3000

WORKDIR /app/apps/webapp
CMD ["pnpm", "start"]
