FROM node:18

RUN npm install -g pnpm

WORKDIR /app

COPY . .

RUN pnpm install --frozen-lockfile

# ⬅️ Add this step to ensure Prisma types are generated
RUN npx prisma generate

RUN pnpm build
RUN pnpm --filter webapp build

EXPOSE 3000

WORKDIR /app/apps/webapp

CMD ["pnpm", "start"]
