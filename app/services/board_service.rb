# Handle all operation for a board game
require 'sinatra'

class BoardService
  DEFAULT_BOMBS = 10

  def initialize(r, c, bombs)
    @r = (r || 10).to_i
    @c = (c || 10).to_i
    @bombs = (bombs || DEFAULT_BOMBS).to_i
    @board = Array.new(@r) { Array.new(@c){0} }
    @bombsInd = []
  end

  def generate
    # place bombs accross the board
    @bombs.times { @bombsInd << set_bomb }
    @bombsInd.each do |loc|
      set_around_cells(loc[0], loc[1])
    end

    @board
  end

  private

  def set_around_cells(rowi, coli)
    min_row = [rowi - 1, 0].max
    max_row = [rowi + 1, @r - 1].min

    min_col = [coli - 1, 0].max
    max_col = [coli + 1, @c - 1].min
    (min_row..max_row).each do |i|
      (min_col..max_col).each do |j|
        @board[i][j] += 1 unless (i === rowi && j === coli) || @board[i][j] === -1
      end
    end
  end

  def set_bomb
    rloc = Random.rand(0..@r - 1)
    cloc = Random.rand(0..@c - 1)
    unless @bombsInd.include? [rloc, cloc]
      @board[rloc][cloc] = -1
      return [rloc, cloc]
    end
    set_bomb
  end
end
