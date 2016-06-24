require 'rspec'
require '../lib/Passwordcheker'
require 'pry'

describe Passwordcheker do
  before(:each) do
    @subject = Passwordcheker.new("alina@ironhack.com", "alinakaaAsa12@")
    @length = @subject.check_length
    @chars = @subject.check_char
    @myemail = @subject.check_email
    # binding.pry
  end


  describe "#check_length" do
    it "check 7 caracter" do
      expect(@length).to be true
    end
  end

  describe "#check_char" do
    it "check 1letter, 1number, 1symbol" do
      expect(@chars).to be true
    end
  end

  describe "#check_email" do
    it "check password to NOT contain neither the name nor the domain of the email." do
      expect(@myemail).to be false
    end
  end

end
