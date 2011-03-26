#!/usr/bin/env ruby
require 'dense_matrix'
require 'random_column'

I,J,K = 3,2,1

seed = (ARGV[0] || Time.now).to_i
srand seed

A = DenseMatrix.new I,J
A.random_fill 10

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

puts A.inspect
A.pairwise_pt_distances

puts A_.inspect
A_.pairwise_pt_distances
