#!/usr/bin/env ruby
require 'random_projection'

class ProjectTwoCircles < RandomProjection 

    def specific_i
      10
    end

    def add_random_rows_using_builder
      (@I/2).times { @builder.add_random_row 8,2,2,:red }
      (@I/2).times { @builder.add_random_row 2,8,2,:blue }
    end

end

ProjectTwoCircles.new.run
