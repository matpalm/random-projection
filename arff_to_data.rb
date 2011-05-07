#!/usr/bin/env ruby
# see README for intended usage

seen_data_marker = false
STDIN.each do |line|
  line.chomp!
  if line == '@data'
    seen_data_marker = true
  else
    next unless seen_data_marker
    puts line
  end
end

