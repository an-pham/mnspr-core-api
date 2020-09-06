require 'rails_helper'

RSpec.describe 'BoardService' do
  it 'generates new board with correct bombs' do
    board = BoardService.new(3, 3, 4).generate
    count = 0
    board.each_with_index do |row, xi|
      row.each_with_index do |col, yi|
        count += 1 if board[xi][yi] == -1
      end
    end

    expect(count).to eq(4)
  end
end
