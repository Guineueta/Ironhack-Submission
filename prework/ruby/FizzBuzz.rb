

(1..100).each do |n|

	result=""
	
	if n%3==0
		result="Fizz"
	end

	if n%5==0

		result+="Buzz"
	end

x=n.to_s.split(//)

	if x[0]=="1"

		result+="Bang"
	end


	if result==""
		puts n
	else
		puts result
	end


end

