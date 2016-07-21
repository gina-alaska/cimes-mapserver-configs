#simple tool to sort list of npp images by date

require "date"
require "time"
require "json"

def get_time(ln) 
	ln.chomp!
        time_s = ln.split(".")[-2].split("_")[0]
        date_s = ln.split(".")[-3]
	
   	tm = Time.strptime(date_s+"T"+time_s, '%y%jT%H%M') + date_s[2,3].to_i*60*60*24
	puts("#{date_s}T#{time_s} -> #{tm}")
	tm
end

def format_time(tm)
	tm.strftime('%FT%T')
end

ARGV.each do |item|
	items = File.open(item) {|fd| JSON.load(fd) } 
	
end
