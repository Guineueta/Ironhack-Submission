class FizzBuzz

  def fizzbuss_do(number)

    word= ""

    if number%3 == 0
      word += "Fizz"
    end

    if number%5 == 0
        word += "Buzz"
    end

    if word == ""
      word = number
    end

    word

  end
end
