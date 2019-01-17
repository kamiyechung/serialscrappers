require_relative "../lib/serialscrappers"

it "results_hash" do 
  expect({BTC: 3456.7}).to have_key(:BTC)

