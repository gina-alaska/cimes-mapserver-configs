require "date"
require "time"

def get_time(ln) 
	ln.chomp!
        time_s = ln.split(".")[-3].split("_")[0]
        date_s = ln.split(".")[-4]

	puts("#{date_s}T#{time_s}")	

   	tm = Time.strptime(date_s+"T"+time_s, '%Y%m%dT%H%M') 
	puts("#{date_s}T#{time_s} -> #{tm}")
	tm
end


ARGV.each do |item|
	items = File.readlines(item)
	items.sort! {|x,y| get_time(x).to_f <=> get_time(y).to_f}
	File.open("sorted"+item, "w"){|fd| fd.puts(items.join("\n")) }
end
