# MechMathPortal 🌐

Информационный портал механико-математического факультета ЮФУ, разработанный для обеспечения студентов, преподавателей и абитуриентов актуальной информацией о жизни института. Проект реализован в рамках выпускной квалификационной работы и включает функциональность для управления контентом, расписаниями и пользователями.

## Описание 📋

MechMathPortal — это современный веб-портал, предоставляющий доступ к новостям, объявлениям, событиям, расписаниям, информации о кафедрах и сотрудниках. Система поддерживает ролевую модель доступа, динамическую фильтрацию расписаний и административную панель для централизованного управления контентом.

## Основные возможности ✨

- **Управление контентом**: Создание, редактирование и удаление новостей, объявлений и событий.
- **Расписания**: Динамическая фильтрация по учебному году, курсу, форме обучения, семестру и типу расписания.
- **Админ-панель**: Полный контроль над сущностями (пользователи, кафедры, сотрудники, контент) с ограниченным доступом для администраторов.
- **Ролевая модель**: Аутентификация и авторизация пользователей с разграничением прав (администратор, пользователь).
- **Адаптивный интерфейс**: Поддержка десктопных и мобильных устройств с использованием Tailwind CSS.
- **Интерактивность**: Мобильное меню и выпадающие списки с анимацией, реализованные через JavaScript.

## Технологии 🛠️

- **Backend**: Ruby on Rails 7.1, ActiveRecord, ActiveStorage
- **Database**: PostgreSQL 16
- **Frontend**: Tailwind CSS 3.4, Font Awesome, Alpine.js
- **Пагинация**: Pagy 6.0
- **Асинхронность**: Turbo Streams 8.0
- **Язык**: Ruby 3.3
- **Другое**: ERB, JavaScript (ES Modules)

## Установка 🚀

### Требования
- Ruby 3.3
- Rails 7.1
- PostgreSQL 16
- Node.js (для JavaScript-зависимостей)
- Yarn или npm

### Шаги
1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/synthematik/graduate_work.git
   cd MechMathPortal
   ```
2. Установите зависимости:
   ```bash
   bundle install
   yarn install
   ```
3. Настройте базу данных:
   ```bash
   cp config/database.yml.example config/database.yml
   # Настройте database.yml с вашими данными PostgreSQL
   rails db:create db:migrate db:seed
   ```
4. Запустите сервер:
   ```bash
   rails server
   ```
5. Откройте в браузере: `http://localhost:3000`

## Использование 📖

- **Для пользователей**: Зарегистрируйтесь или войдите, чтобы просматривать новости, события и расписания. Используйте фильтры для поиска расписаний.
- **Для администраторов**: Войдите с учетной записью с ролью администратора, чтобы управлять контентом через панель `/admin`.
- **API**: В текущей версии API не реализован, но структура базы данных поддерживает будущие расширения.

## Структура проекта 🗂️

- `app/models`: Модели данных (`User`, `Article`, `Schedule`, и др.).
- `app/controllers`: Контроллеры для публичной части и админ-панели.
- `app/views`: Шаблоны ERB (публичные и админские).
- `db/migrate`: Миграции базы данных.
- `config`: Конфигурация Rails, включая `database.yml`.

## Контрибьютинг 🤝

Приветствуются любые улучшения! Создайте issue или отправьте pull request с описанием изменений.

## Лицензия 📜

[MIT License](LICENSE)

## Контакты 📧

- Автор: [Гарик Мнацаканян] (mna@sfedu.ru)
- Репозиторий: [github.com/synthematik/graduate_work](https://github.com/synthematik/graduate_work)

---
Разработано для Южного федерального университета, 2025.
