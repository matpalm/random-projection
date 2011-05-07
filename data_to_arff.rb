#!/usr/bin/env ruby
# convert to weka arff
written_header = false
STDIN.each do |line|
  if not written_header 
    num_dimensions = line.split(',').size - 1
    puts "@relation demo3"
    num_dimensions.times do |d|
      puts "@attribute V#{d} NUMERIC"
    end
    puts "@attribute CLASS {0,1}"
    puts "@data"
    written_header = true
  end
  puts line
end


