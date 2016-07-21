#simple tool to add time field to json file
require "date"
require "time"
require "json"
require "pp"

def time_from_terra_and_aqua(ln) 
        ln.chomp!
        time_s = ln.split(".")[-3].split("_")[0]
        date_s = ln.split(".")[-4]

        tm = Time.strptime(date_s+"T"+time_s+"Z", '%Y%m%dT%H%M%Z')
        #puts("#{date_s}T#{time_s} -> #{tm}")
        tm
end

def time_from_npp(ln) 
	ln.chomp!
        time_s = ln.split(".")[-2].split("_")[0]
        date_s = ln.split(".")[-3]
	
   	tm = Time.strptime(date_s+"T"+time_s+"Z", '%y%jT%H%M%Z') + date_s[2,3].to_i*60*60*24
	#puts("#{date_s}T#{time_s} -> #{tm}")
	tm
end

def get_time(ln) 
	return time_from_terra_and_aqua(ln) if ln.include?("a1.")
	return time_from_terra_and_aqua(ln) if ln.include?("t1.")
	time_from_npp(ln) 
end

def format_time(tm)
	tm.strftime('%FT%T')
end


ARGV.each do |item|
	details= File.open(item) {|fd| JSON.load(fd) } 
	details["features"].each do |feature|
		feature["properties"]["time"] =  format_time(get_time(feature["properties"]["location"]))
	end	
	File.open(File.basename(item, "..json") + ".time.json","w") {|fd| JSON.dump(details,fd) }
end
