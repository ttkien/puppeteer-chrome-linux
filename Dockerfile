FROM node:16-bullseye
RUN apt-get update && apt-get install -y \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon-x11-0 \
    libxcomposite-dev \
    libxdamage1 \
    libxrandr2 \
    libgbm-dev \
    libasound2 \
    pngquant \
    chromium \
    chromium-common \
    vim

# Tell puppeter to skip chromium installation
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

RUN mkdir -p /home/circleci/
RUN groupadd -r circleci && useradd -r -g circleci -G audio,video circleci
RUN chown -R circleci:circleci /home/circleci
