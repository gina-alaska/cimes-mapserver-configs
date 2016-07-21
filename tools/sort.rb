#snipit of unknown usefulness


ARGV.each do |item|
	File.readlines(item).each do |ln| 	
		ln.chomp!
		puts File.basename(ln,".tif") + "-> " + ln.split(".")[-3] + "T" + ln.split(".")[-2].split("_")[0]
	end
end
