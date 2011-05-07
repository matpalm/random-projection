#!/usr/bin/env ruby

# generate arff two clusters of points
# for N dimensional clusters around (2,2,2,...) & (8,8,8,...)
raise "usage: #{$0} NUM_DIMENSIONS JITTER POINTS_IN_EACH_CLUSTER" unless ARGV.size==3

DIMENSIONS, JITTER, POINTS_IN_EACH_CLUSTER_AT_EACH_CENTER = ARGV.map { |i| i.to_i }
CLUSTER_CENTERS = [2,8]

CLUSTER_CENTERS.each_with_index do |center, clazz|
  POINTS_IN_EACH_CLUSTER_AT_EACH_CENTER.times do
    data = []
    DIMENSIONS.times do
      data << center + (2*rand*JITTER) - JITTER
    end
    data << clazz
    puts data.join(',')
  end
end

