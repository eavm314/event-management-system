FROM node:20.18-alpine3.21

ENV NODE_ENV=production
ENV PORT=9000

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 9000
CMD ["npm", "run", "start:prod"]
