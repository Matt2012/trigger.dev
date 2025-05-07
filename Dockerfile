FROM node:18

RUN npm install -g pnpm

WORKDIR /app

COPY . .

RUN pnpm install

# ✅ Fix: override Prisma client version
RUN pnpm add -w @prisma/client@5.2.0

# 🔧 Build internal packages first
RUN pnpm build

# 🔧 Then build the webapp
RUN pnpm --filter webapp build

EXPOSE 3000

WORKDIR /app/apps/webapp

CMD ["pnpm", "start"]
