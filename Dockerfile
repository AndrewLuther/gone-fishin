FROM node:26-slim
WORKDIR /app

# Use the distro Chromium instead of Puppeteer's downloaded browser. This keeps
# the browser architecture in sync with the image and pulls in its shared libs.
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    chromium \
    ca-certificates \
    fonts-liberation \
  && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./
RUN npm ci

COPY . ./

EXPOSE 3000
CMD ["npm", "run", "prod"]
