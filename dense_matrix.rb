# simple array back 2d matrix

class DenseMatrix

  attr_accessor :rows, :cols, :colour_for_row

  def initialize rows, cols
    @rows, @cols = rows, cols
    @data_by_row = []
    @rows.times { @data_by_row << [] }
    @colour_for_row = []
  end

  def random_fill max_val
    @data_by_row = []
    @rows.times do 
      row = []
      @cols.times { row << rand(max_val) }
      @data_by_row << row
    end
  end

  def set i, j, val
    bounds_check i, j 
    @data_by_row[i][j] = val
  end

  def get i, j
    bounds_check i, j 
    @data_by_row[i][j] || 0
  end

  def row i
    @data_by_row[i]
  end

  def plot_to filename
    # write a data file
    data_file_path = "/dev/shm/#{filename}.dat"
    data_file = File.new(data_file_path, 'w')
    @data_by_row.each_with_index do |row, index|
      if row.size==2
        data_file.print row.join(",")
      else
        raise "wtf?" unless row.size==1
        data_file.print "#{row},#{row}" # we want to plot 1d on main diagonal
      end
      data_file.print ",#{@colour_for_row[index].to_s}"
      data_file.print "\n"
    end
    data_file.close
    # write an R script
    r_script_path = "/dev/shm/#{filename}.R"
    r_script = File.new(r_script_path, 'w')
    r_script.puts <<-EOF
      lims = c(0,10)
      library(ggplot2)
      a = read.csv("#{data_file_path}",header=FALSE)
      png("#{filename}.png", width=600, height=600, bg="transparent")
      plot(a$V1,a$V2,col=sapply(a$V3,toString),pch=19,lwd=10,xlim=lims,ylim=lims)
      dev.off()
    EOF
    r_script.close
    # run said R script
    puts "rendering #{filename}.png from #{r_script_path} using data #{data_file_path}"
    `R --vanilla < #{r_script_path}`
  end

  private 

  def bounds_check i, j
    raise "out of bounds" if i<0 || i>=@rows || j<0 || j>=@cols
  end

end
