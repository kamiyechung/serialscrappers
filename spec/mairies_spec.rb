require_relative '../Lib/mairies'

describe "the megahash" do
    it "counts the number of items in the array" do
        expect(megahash.size).to eq(185)
    end
end
