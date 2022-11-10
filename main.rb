#!/usr/bin/env ruby
require './app'
require './database'
require 'json'

def main
  app = App.new
  app.loaddata
  while 1.positive?
    app.menu
    user_input = gets.chomp.to_i
    app.excute(user_input)
  end
end
main
