# random column generator
# provides column iterator and ensures unit length is 1

class RandomColumn

  def initialize rows, seed
    @rows, @seed = rows, seed
  end

  def each_with_index
    @length ||= calc_length_of_vector 
    srand @seed
    @rows.times { |r| yield rand / @length, r }
  end

  private

  def calc_length_of_vector 
    srand @seed
    length_sqr = 0
    @rows.times do
      val = rand
      length_sqr += val * val
    end
    Math.sqrt length_sqr
  end

end
