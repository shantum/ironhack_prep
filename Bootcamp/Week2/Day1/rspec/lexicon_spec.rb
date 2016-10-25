--color
--require 'spec_helper'
--require 'lexicon'

RSpec.describe Lexicon do
  describe "#eat_t" do
    it "removes every letter t from the input" do
      @lexi = Lexicon.new
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end
end