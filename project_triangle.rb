#!/usr/bin/env ruby
require 'random_projection'

class ProjectTriangle < RandomProjection

  def specific_i
    30
  end

  def add_random_rows_using_builder
    (@I/3).times { @builder.add_random_row 1,1, 1, :red }
    (@I/3).times { @builder.add_random_row 9,1, 1, :green }
    (@I/3).times { @builder.add_random_row 5,7.66, 1, :blue }
  end
  
end

ProjectTriangle.new.run
