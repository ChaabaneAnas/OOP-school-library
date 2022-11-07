#!/usr/bin/env ruby

require './app'

def main
  app = App.new
  app.excute while 1.positive?
end
main
