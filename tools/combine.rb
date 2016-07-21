#simple tool to combine lists of sorted files
list = ["_DNB", "_ATM1_500_ATM4_ATM3_ATM1_alaska_albers", "_7_2_1_500m_1_alaska_albers", "_2_6_1_500m_1_alaska_albers", "_3_6_7_alaska_albers", "_I05", "_M05_M04_M03_I01", "_I03_I02_I01"]

list.each do |item|
	system("cat 20*/*#{item}.list.txt > combined/#{item}.list.txt")
end
