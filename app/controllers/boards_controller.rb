# require 'board_service'
require 'sinatra'
require "sinatra/json"

class BoardsController < ApplicationController
  get '/new' do
    board = BoardService.new(params["r"], params["c"], params["bombs"] || 10).generate
    json({
        :status => '200',
        :rows => params[:r],
        :cols => params[:c],
        :bombs => params[:bombs],
        :board => board
    })
  end

end
