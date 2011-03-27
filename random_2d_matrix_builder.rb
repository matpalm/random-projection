class Random2DMatrixBuilder

  def initialize matrix
    @matrix = matrix    
    @building_row = 0
  end

  def add_random_row x, y, max_jitter, colour
    dx = rand(2*max_jitter) - max_jitter
    @matrix.set @building_row, 0, x + dx 
    dy = rand(2*max_jitter) - max_jitter
    @matrix.set @building_row, 1, y + dy
    @matrix.colour_for_row[@building_row] = colour
    @building_row += 1
  end

end

