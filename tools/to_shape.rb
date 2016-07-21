#create tile index.  ogr damanges dates, and truncates field lenths, so extra jumping around is required
#start with an empty tile index, with a location, and time field. 
ARGV.each do |x|
	basename = File.basename(x, ".json")
	[".shp",".shx", ".dbf"].each {|item| system("cp -v foo#{item} #{basename}#{item}") }
	system("ogr2ogr -update -append -nln #{basename} #{basename}.shp #{x}")
	#system("ogr2ogr -fieldTypeToString all #{File.basename(x, ".json")}.shp #{x}")
end
