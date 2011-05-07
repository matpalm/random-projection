class Random2DMatrixBuilder

  def initialize matrix
    @matrix = matrix    
    @building_row = 0
  end

  def add_random_row args
    args[:dimensions].times do |dimension|
      delta = rand * 2 * args[:max_jitter] - args[:max_jitter]
      coord = args[:center] + delta
      @matrix.set @building_row, dimension, coord
    end
    @matrix.colour_for_row[@building_row] = args[:colour]
    @building_row += 1
  end

end

