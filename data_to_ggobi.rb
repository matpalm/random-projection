#!/usr/bin/env ruby
# convert to ggobi
records = []
STDIN.each do |line|
  records << line.chomp.split(',')
end

puts <<EOF
<?xml version="1.0"?>
<!DOCTYPE ggobidata SYSTEM "ggobi.dtd">
<ggobidata count="1">
<activeColorScheme name="Spectral 6"/>
<data>
EOF

number_dimensions = records.first.size - 1
puts %{<variables count="#{number_dimensions + 1}">}
number_dimensions.times do |d|
  puts %{ <realvariable name="f#{d+1}"/>}
end
puts %{</variables>}

puts %{<records count="#{records.size}" glyph="fc 1" color="1">}

records.each do |record|
  colour = record.delete_at(record.length-1)
  puts %{<record color="#{colour}">}
  record.each { |pt| print %{<real>#{pt}</real>} }; puts
  puts %{</record>}
end

puts <<EOF
</records>
</data>
</ggobidata>
EOF

