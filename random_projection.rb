#!/usr/bin/env ruby
require 'dense_matrix'
require 'random_2d_matrix_builder'
require 'random_column'

class RandomProjection 

  NUM_DIFFERENT_PROJECTIONS = 5

  def run
    @I = specific_i
    @J = 2
    @K = 1

    seed = (ARGV[0] || Time.now).to_i
    srand seed

    @A = DenseMatrix.new @I, @J
    @builder = Random2DMatrixBuilder.new @A
    add_random_rows_using_builder

    puts @A.inspect
    @A.plot_to 'original'

    NUM_DIFFERENT_PROJECTIONS.times do |n|

      @A_ = DenseMatrix.new @I, @K

      @K.times do |k|

        random_column = RandomColumn.new @J, seed
        seed += 1

        @I.times do |i|
          
          row = @A.row(i)
          dot_prod = 0.0
          random_column.each_with_index do |p, idx|
            dot_prod += row[idx] * p 
          end

          @A_.set i, k, dot_prod
        end
      end

      @I.times { |i| @A_.colour_for_row[i] = @A.colour_for_row[i] }

      puts @A_.inspect
      @A_.plot_to "projection_#{n}"
    end

    def specific_i
      raise "awesome abstract ruby class"
    end

    def add_random_rows_using_builder
      raise "awesome abstract ruby class"
    end

  end

end

