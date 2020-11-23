# config.ru (run with rackup)

require 'sinatra'
require './controllers/application_controller'

Dir.glob('./{helpers,controllers,services}/*.rb').each { |file| require file }

map('/boards') { run BoardsController }
run ApplicationController
