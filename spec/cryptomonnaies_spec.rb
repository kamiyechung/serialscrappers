
require_relative '../Lib/cryptomonnaies'

describe "the results_hash function" do
    it "counts the number of hash in the array" do
        expect(results_hash.count).to eq(2111)
    end
end