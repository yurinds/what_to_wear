require_relative 'lib/wear'
require_relative 'lib/many_clothes'

current_path = File.dirname(__FILE__)

directory_files = Dir.new('data')

all_clothes = []
directory_files.each do |file_path|
  next if ['.', '..'].include?(file_path)

  full_path = current_path + '/data/' + file_path
  next unless File.exist?(full_path)

  file_lines = File.readlines(full_path, chomp: true)

  wear = Wear.new(file_lines)

  all_clothes << wear unless wear.abort?
end

clothes = ManyClothes.new(all_clothes)

print 'Сколько градусов за окном? (можно с минусом) '
temperature = STDIN.gets.to_i

all_types = clothes.all_clothes_types

correct_clothes = clothes.clothes_for_temperature(temperature)

if correct_clothes.empty?
  puts 'В вашем гардеробе нет вещей для такой погоды! Не пора ли навестить магазин? :)'
else
  puts 'Предлагаем сегодня надеть:'
  all_types.each.with_index(1) do |item, index|
    puts "#{index}. #{correct_clothes[item].sample}" if correct_clothes[item]
  end
end
