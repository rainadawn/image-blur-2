class Image

  def initialize(array)
    @image = array
  end

  def find_ones
		ones = []
		@image.each_with_index do |row, row_num|
			row.each_with_index do |val, col_num|
				if val == 1
					ones << [row_num, col_num]
				end
			end
		end
		
		return ones
	
	end
	
	def blur
		ones = find_ones
			@image.each_with_index do |row, row_num|
				row.each_with_index do |val, col_num|
					ones.each do |found_row_num, found_col_num|

						if row_num == found_row_num && col_num == found_col_num
							@image[row_num -1] [col_num] = 1 unless row_num == 0
							@image[row_num +1] [col_num] = 1 unless row_num >= 3
							@image[row_num] [col_num -1] = 1 unless col_num == 0
							@image[row_num] [col_num +1] = 1 unless col_num >= 3
						end
					end
				end
			end
	end
	def output_image
    @image.each do |row|
      puts row.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.blur
image.output_image
