require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits