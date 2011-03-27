#!/usr/bin/env ruby
require 'dense_matrix'
require 'random_2d_matrix_builder'
require 'random_column'

I,J,K = 9,2,1 # 60 pts (20 per triangle point) in 2d projected to 1d

seed = (ARGV[0] || Time.now).to_i
srand seed

A = DenseMatrix.new I,J
builder = Random2DMatrixBuilder.new A
colours = %W(red green blue)
(I/3).times do |row|
  builder.add_random_row 0,0,2,:red
  builder.add_random_row 10,0,2,:green
  builder.add_random_row 5,8.66,2,:blue
end

A_ = DenseMatrix.new I,K

K.times do |k|

  random_column = RandomColumn.new J, seed
  seed += 1

  I.times do |i|
    
    row = A.row(i)
    dot_prod = 0.0
    random_column.each_with_index do |p, idx|
      dot_prod += row[idx] * p 
    end

    A_.set i, k, dot_prod
  end
end

I.times { |i| A_.colour_for_row[i] = A.colour_for_row[i] }

puts A.inspect
A.write_to 'a'

puts A_.inspect
A_.write_to 'a_'
