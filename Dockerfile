FROM node:18

RUN npm install -g pnpm

WORKDIR /app

COPY . .

RUN pnpm install

# 🔧 NEW: build all internal packages first
RUN pnpm build

# 🔧 THEN: build the webapp (no longer fails due to missing deps)
RUN pnpm --filter webapp build

EXPOSE 3000

WORKDIR /app/apps/webapp

CMD ["pnpm", "start"]
