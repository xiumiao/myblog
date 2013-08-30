#.pryrc
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'f', 'finish'

Pry.config.editor="vi -nofork"

#Print Ruby Version at startup
#Pry.config.hooks.add_book(:when_started, :say_hi) do
#    puts "Using Ruby version #{RUBY_VERSION}"
#end

#Require Sinatra application
load "my_app.rb"

