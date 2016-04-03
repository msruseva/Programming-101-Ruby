module GameOfLife
  class Board
    include Enumerable

    attr_accessor :board

    def initialize(*coordinates)
      if coordinates and coordinates.size == 1 and coordinates.first.is_a?(Array)
        @board = coordinates.first.uniq
      else
        @board = coordinates.uniq
      end
    end

    def [](x, y)
      @board.include? [x, y]
    end

    def each
      @board.each { |cell| yield cell }
    end

    def neighbours(cell)
      x, y = cell
      neighbours = [[x - 1, y], [x - 1, y + 1], [x, y + 1], [x + 1, y + 1],
                    [x + 1, y], [x + 1, y - 1], [x, y - 1], [x - 1, y - 1]]
    end

    def alive_neighbours_count(cell)
      neighbours(cell).select { |cell| @board.include? cell }.count
    end

    def dead_neighbours(cell)
      neighbours(cell).reject { |cell| @board.include? cell }
    end

    def next_generation
      new_board = @board.select { |cell| [2, 3].include? alive_neighbours_count(cell) }

      @board.each do |cell|
        new_board += dead_neighbours(cell).select { |cell| alive_neighbours_count(cell) == 3 }
      end

      Board.new new_board
    end
  end
end
