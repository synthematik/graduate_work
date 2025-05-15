source "https://rubygems.org"

ruby "~> 3.4.2"

gem "rails", "~> 7.2.2.1"
gem "pg", "~> 1.1"                              # PostgreSQL
gem "puma", ">= 5.0"                            # Веб-сервер
gem "bcrypt", "~> 3.1.7"                        # Для has_secure_password
gem "sprockets-rails"                           # Поддержка ассетов
gem "turbo-rails"                               # Hotwire
gem "stimulus-rails"                            # Stimulus
gem "jbuilder"                                  # Для JSON API
gem "jsbundling-rails"                          # Поддержка JS
gem "cssbundling-rails"                         # Поддержка CSS
gem "bootsnap", require: false                  # Ускорение загрузки
gem "tzinfo-data", platforms: %i[windows jruby] # Для Windows
gem "dotenv-rails", groups: [:development, :test] # ENV-переменные
gem "valid_email2"
gem "pagy", "~> 9.3"
gem "image_processing", "~> 1.2"
gem "mini_magick"

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude" # отладка
  gem "rubocop", require: false             # линтер
  gem "standard", require: false            # стандарт форматирования
  gem "rubocop-rails-omakase", require: false
  gem "lefthook"                            # гит-хуки
  gem "brakeman", require: false            # статический анализатор
end

group :development do
  gem "web-console" # консоль в браузере
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby] # лучшее отображение ошибок
end

group :test do
  gem "capybara" # интеграционные тесты
  gem "selenium-webdriver" # для браузерного тестирования
end
