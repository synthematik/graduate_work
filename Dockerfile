# Используем официальный образ Ruby
FROM ruby:3.4.2-slim

# Устанавливаем зависимости
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    libyaml-dev \
    nodejs \
    postgresql-client \
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

# Предкомпиляция ассетов (если нужно)
# RUN bundle exec rails assets:precompile

# Порт, который будет слушать приложение
EXPOSE 3000

# Команда для запуска сервера
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]