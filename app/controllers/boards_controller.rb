require 'sinatra'
require "sinatra/json"

class BoardsController < ApplicationController
  get '/new' do
    board = BoardService.new(params["r"], params["c"], params["bombs"] || 10).generate
    json({
        :status => '200',
        :rows => params[:r] || 10,
        :cols => params[:c] || 10,
        :bombs => params[:bombs] || 10,
        :board => board
    })
  end

end
