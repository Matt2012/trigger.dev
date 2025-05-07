FROM node:18

RUN npm install -g pnpm

WORKDIR /app

COPY . .

RUN pnpm install
RUN pnpm --filter webapp build

EXPOSE 3000

WORKDIR /app/apps/webapp

CMD ["pnpm", "start"]
