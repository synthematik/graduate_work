# line_ending_fixer.rb

def fix_line_endings(file_path, create_backup: true)
  unless File.file?(file_path)
    raise ArgumentError, "Файл не найден: #{file_path}"
  end

  content = File.read(file_path)

  fixed_content = content.delete("\r")
  File.write(file_path, fixed_content)
  puts "Исправлены окончания строк в: #{file_path}"
end

# Пример вызова:
if __FILE__ == $0
  file = ARGV[0]
  if file.nil?
    puts "Usage: ruby line_ending_fixer.rb path/to/file.rb"
    exit 1
  end

  fix_line_endings(file)
end
