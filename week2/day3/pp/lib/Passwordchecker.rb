require 'pry'

class Passwordchecker
  attr_accessor :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

  def check_length
    if @password.size >= 7
      true
    else
      false
    end
  end

  def check_char
    @small_letters = /[a-z]/
    @big_letters = /[A-Z]/
    @numbers = /[0-9]/
    @characters = /\W/
    if @small_letters.match(@password) && @big_letters.match(@password) && @numbers.match(@password) && @characters.match(@password)
      true
    end
  end

  def check_email
    if @email.include?("@") && @email.include?(".")
      domain = @email.split("@")[1].split(".")[0]
      name = @email.split("@")[0]
      if @password.include?(domain) || @password.include?(name)
        false
      else
        true
      end
    end
  end
  def validate
    if check_length == true && check_char == true && check_email == true
      true
    else
      false
    end

  end
end
