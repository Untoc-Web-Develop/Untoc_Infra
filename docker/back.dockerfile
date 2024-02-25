FROM node:20

WORKDIR /app/code

COPY ./data/backend/code /app/code
COPY ./data/backend/.env /app/code/.env

RUN npm ci

RUN npm run build

CMD ["node", "dist/main.js"]