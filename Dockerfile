# Используем официальный образ Ruby
FROM ruby:3.4.2-slim

# Устанавливаем зависимости
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    libyaml-dev \
    nodejs \
    postgresql-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Создаем рабочую директорию
WORKDIR /app

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Копируем Gemfile и Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Устанавливаем гемы
RUN bundle install

# Копируем остальные файлы проекта
COPY . .

# Install JavaScript dependencies
ARG NODE_VERSION=22.15.0
ARG YARN_VERSION=1.22.22
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

# Порт, который будет слушать приложение
EXPOSE 3000

# Команда для запуска сервера
RUN ["yarn", "install"]
RUN ["yarn", "build", "--watch"]
RUN ["yarn", "build:css", "--watch"]

CMD sh -c "bundle exec rails assets:precompile && bundle exec rails server -b 0.0.0.0"