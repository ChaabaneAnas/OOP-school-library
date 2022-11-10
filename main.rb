require './app'

def main
  app = App.new
  while 1.positive?
    app.menu
    user_input = gets.chomp.to_i
    app.excute(user_input)
  end
end
main
