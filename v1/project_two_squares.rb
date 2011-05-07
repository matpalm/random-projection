#!/usr/bin/env ruby
require 'random_projection'

class ProjectTwoCircles < RandomProjection 

    def specific_i
      50
    end

    def add_random_rows_using_builder
      (@I/2).times { @builder.add_random_row :center => 2, :max_jitter => 2, :dimensions => 2, :colour => :red }
      (@I/2).times { @builder.add_random_row :center => 8, :max_jitter => 2, :dimensions => 2, :colour => :blue }
    end

end

ProjectTwoCircles.new.run
