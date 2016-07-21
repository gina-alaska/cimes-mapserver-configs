#makes a tile index from a file containing a list of files
ARGV.each do |x|
	items = File.readlines(x)
	items.each{|i| system("gdaltindex #{File.basename(x,".txt")}.shp #{i.chomp}") }
end
