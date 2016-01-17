require_relative '../lib/socket_caller'

RSpec.describe "#validate" do
  context "with valid input" do
    let (:input) { { "word" => "word", "color" => "black"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq nil
    end
  end
  context "without word" do
    let (:input) { { "word" => "", "color" => "black"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq "no streaming without the word"
    end
  end
  context "without color" do
    let (:input) { { "word" => "word"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq "no streaming without color"
    end
  end
end
