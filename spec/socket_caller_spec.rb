require_relative '../lib/socket_caller'

RSpec.describe "#validate" do
  context "with valid input" do
    let (:input) { { "word" => "word", "color" => "black", "channel" => "channel"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq nil
    end
  end
  context "without word" do
    let (:input) { { "word" => "", "color" => "black", "channel" => "channel"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq "no streaming without the word"
    end
  end
  context "without color" do
    let (:input) { { "word" => "word", "channel" => "channel"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq "no streaming without color"
    end
  end
  context "without channel" do
    let (:input) { { "word" => "word", "color" => "black"} }
    it "should return nil" do
      validation_result = validate(input)
      expect(validation_result).to eq "no streaming without channel, we wouldn't know where to stream"
    end
  end
end
