# Handle all operation for a board game

class BoardService
  DEFAULT_BOMBS = 10

  def initialize(r, c, bombs)
    @r = r.to_i
    @c = c.to_i
    @bombs = (bombs || DEFAULT_BOMBS).to_i
    @board = Array.new(@r) { Array.new(@c){0} }
  end

  def generate
    # place bombs accross the board
    @bombs.times { set_bomb }
    @board.each_with_index do |_row, xi|
      _row.each_with_index do |_col, yi|
        set_around_cells(xi, yi) if @board[xi][yi] === -1
      end
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
    if @board[rloc][cloc] != -1
      @board[rloc][cloc] = -1
      return
    end
    set_bomb
  end
end
