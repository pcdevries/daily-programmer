alphabet = {
'A' => ['0 0 1 0 0',
		'0 1 0 1 0',
		'1 0 0 0 1',
		'1 1 1 1 1',
		'1 0 0 0 1',
		'1 0 0 0 1',
		'1 0 0 0 1'],

'B' => ['1 1 1 1 0',
		'1 0 0 0 1',
		'1 0 0 0 1',
		'1 1 1 1 0',
		'1 0 0 0 1',
		'1 0 0 0 1',
		'1 1 1 1 0'],

'C' => ['0 1 1 1 0',
		'1 0 0 0 1',
		'1 0 0 0 0',
		'1 0 0 0 0',
		'1 0 0 0 0',
		'1 0 0 0 1',
		'0 1 1 1 0'],

' ' => ['0 0 0 0 0',
		'0 0 0 0 0',
		'0 0 0 0 0',
		'0 0 0 0 0',
		'0 0 0 0 0',
		'0 0 0 0 0',
		'0 0 0 0 0']
}

puts "PBM Image Creator"
puts "Permitted characters are #{alphabet.keys}"
puts "Enter a string:"
input = gets.chomp.upcase
outputLines = ["", "", "", "", "", "", ""]



input.split("").each do |letter|
	i = 0
	while i < 7
		outputLines[i] += alphabet[letter][i] + " 0 "
		i += 1
	end
end

output = File.open("image.pbm", "w")
output.puts 'P1'
output.puts "#{input.split("").length * 6} 7"
outputLines.each do |line|
	output.puts line
end