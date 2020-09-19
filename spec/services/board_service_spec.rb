require 'rails_helper'

RSpec.describe 'BoardService' do
  let(:cols) { 9 }
  let(:rows) { 9 }
  let(:bombs) { 10 }
  let(:board) { BoardService.new(cols, rows, bombs).generate }

  it 'generates new board with correct bombs' do
    count = 0
    board.each_with_index do |row, xi|
      row.each_with_index do |col, yi|
        count += 1 if board[xi][yi] == -1
      end
    end

    expect(count).to eq(bombs)
  end

  it 'calculates the correct bombs around a cell' do
    board.each_with_index do |row, xi|
      row.each_with_index do |col, yi|
        expect(board[xi][yi]).to eq sum_bombs(xi, yi) unless board[xi][yi] === -1
      end
    end
  end

  def sum_bombs(rowi, coli)
    sum = 0
    min_row = [rowi - 1, 0].max
    max_row = [rowi + 1, rows - 1].min

    min_col = [coli - 1, 0].max
    max_col = [coli + 1, cols - 1].min
    (min_row..max_row).each do |i|
      (min_col..max_col).each do |j|
        sum += 1 if board[i][j] === -1 && (i != rowi || j != coli)
      end
    end
    sum
  end
end
