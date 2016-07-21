#simple tool to create initial list of files for each set.
list = ["_DNB", "_ATM1_500_ATM4_ATM3_ATM1.alaska_albers", "_7_2_1_500m_1.alaska_albers", "_2_6_1_500m_1.alaska_albers", "_3_6_7.alaska_albers", "_I05", "_M05_M04_M03_I01", "_I03_I02_I01"]

list.each do |item|
	tag = item.split(/\W+/).join("_")
	list = Dir.glob("/gluster/feeder/2015/??/*/*#{item}.tif")
	File.open("2015_"+tag+".list.txt", "w") {|fd| fd.puts(list)}
end
