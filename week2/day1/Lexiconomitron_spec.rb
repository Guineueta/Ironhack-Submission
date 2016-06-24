require "rspec"
require "./Lexiconomitron"

describe Lexiconomitron do


  describe "#eat_t" do
    it "removes every letter t from the input" do

      expect(Lexiconomitron.new.eat_t("great scott!")).to eq("grea sco!")
    end
  end
