# config.ru (run with rackup)

require 'sinatra'
require './app/controllers/application_controller'

Dir.glob('./app/{helpers,controllers,services}/*.rb').each { |file| require file }

map('/boards') { run BoardsController }
run ApplicationController
