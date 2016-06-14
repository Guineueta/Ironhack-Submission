def word_sorting(sentence)


	word_s = sentence.split(" ").sort

	word_s.each do |x| 

		print x.gsub(/\W/,'')+" "

	end

end

puts "write a sentence"



y = gets.chomp

word_sorting(y)
