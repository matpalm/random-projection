#!/usr/bin/env ruby
# see README for intended usage

raise "usage: #{$0} RUN_NUMBER" unless ARGV.length==1
I = ARGV.first.to_f

ys = []
data_pts = []
colors = []

seen_data_marker = false
STDIN.each do |line|
  line.chomp!
  if line == '@data'
    seen_data_marker = true
  else
    next unless seen_data_marker
    data_pt, color = line.split(',')
    y = I * 0.5             # stagger each run by 0.5
    y += 0.1 if color=='1'  # bump different colours by a bit so we can see the overlap
    y += 1 unless I == 0
    ys << y
    data_pts << data_pt.to_f
    colors << color
  end
end

# normalise data_pts
min = max = data_pts.first
data_pts.each do |data_pt|
  min = data_pt if data_pt < min
  max = data_pt if data_pt > max
end
delta = max - min
data_pts.map! { |data_pt| (data_pt - min) / delta }

# remit entire data frame
ys.zip(data_pts, colors).each { |tuple| puts tuple.join(',') }

