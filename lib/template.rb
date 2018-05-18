if Rails.version[0].to_i < 5
  puts ''
  puts "\e[31mPathfinder only works with Rails versions greater or equal to 5.0.\e[0m"
  exit
end

require_relative 'pathfinder'
Pathfinder.new(@app_name, self).call
