# simple array back 2d matrix

class Array

  def distance_to other
    dist = 0.0
    self.zip(other).each do |pair|
      delta = pair[0] - pair[1]
      dist += delta * delta
    end
    Math.sqrt dist
  end

end

class DenseMatrix

  def initialize rows, cols
    @rows, @cols = rows, cols
    @data_by_row = []
    @rows.times { @data_by_row << [] }
  end

  def random_fill max_val
    @data_by_row = []
    @rows.times do 
      row = []
      @cols.times { row << rand(max_val) }
      @data_by_row << row
    end
  end

  def set i, j, val
    bounds_check i, j 
    @data_by_row[i][j] = val
  end

  def get i, j
    bounds_check i, j 
    @data_by_row[i][j] || 0
  end

  def row i
    @data_by_row[i]
  end

  def pairwise_pt_distances
    (0...@rows).each do |a|
      ra = row a
      ((a+1)...@rows).each do |b|
        rb = row b
        puts "#{a} #{b} dist=#{ra.distance_to(rb)}"
      end
    end
  end
  
  private 

  def bounds_check i, j
    raise "out of bounds" if i<0 || i>=@rows || j<0 || j>=@cols
  end

end
