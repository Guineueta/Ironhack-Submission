def solve_cipher(i,j=-3)

	word=i.to_s.split(" ")

	word.each do |s|
	
		k=s.to_s.split("")

			k.each do |x|

			y = x.ord + j

			if y<97 

				y += 26

			elsif y>122 

				y -= 26


			end
				
     print y.chr

 	end

 	print " "

	end
end

solve_cipher("uhdo qdph lv grqdog gxfn")




