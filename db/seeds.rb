user = ::User.create!(
  login: 'admin2',
  email: 'admin2@example.com',
  password: 'password',
  password_confirmation: 'password'
)

5.times do |i|
  ::Article.create!(
    title: "Новость №#{i + 1}",
    body: "Это текст новости номер #{i + 1}. Здесь будет размещаться основной контент статьи.",
    user: user
  )
end

puts "Создан пользователь: #{user.login} и #{Article.count} новостей."

Schedule.create!([
   {
     title: 'Расписание 1 курс зимний семестр 2024-2025',
     course_number: 1,
     education_form: :full_time,
     semester_type: :winter,
     schedule_type: :regular_schedule,
     start_year: 2024,
     end_year: 2025,
     file_url: 'https://example.com/schedule_1_course_winter.xlsx',
     user: user
   },
   {
     title: 'График учебного процесса магистратуры 2024-2025',
     course_number: nil,
     education_form: :full_time,
     semester_type: :winter,
     schedule_type: :academic_plan,
     start_year: 2024,
     end_year: 2025,
     file_url: 'https://example.com/academic_plan_masters.pdf',
     user: user
   },
   {
     title: 'Расписание летней сессии 2 курс заочная форма 2023-2024',
     course_number: 2,
     education_form: :part_time,
     semester_type: :summer,
     schedule_type: :session_schedule,
     start_year: 2023,
     end_year: 2024,
     file_url: 'https://example.com/session_schedule_2_course_summer.pdf',
     user: user
   }
  ])
