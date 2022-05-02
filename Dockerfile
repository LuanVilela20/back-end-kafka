FROM ruby:2.7.4-alpine

RUN apk add --no-cache -q --progress \
    build-base \
    busybox \
    ca-certificates \
    curl \
    git \
    gnupg1 \
    imagemagick \
    graphicsmagick \
    libffi-dev \
    libsodium-dev \
    nodejs \
    openssh-client \
    postgresql-dev \
    rsync \
    tzdata \
    yarn

RUN mkdir /app

WORKDIR /app

RUN ls

COPY Gemfile* ./
COPY . /app

RUN gem install bundler

RUN bundle install
