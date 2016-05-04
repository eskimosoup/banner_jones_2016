ConveyancingCalculator.configure do |config|
  config.purchase_fee_bands = [
    { lower_bound: 0, upper_bound: 100000, fee: 450.00 },
    { lower_bound: 100001, upper_bound: 200000, fee: 475.00 },
    { lower_bound: 200001, upper_bound: 300000, fee: 525.00 },
    { lower_bound: 300001, upper_bound: 400000, fee: 575.00 },
    { lower_bound: 400001, upper_bound: 500000, fee: 625.00 },
    { lower_bound: 500001, upper_bound: 600000, fee: 700.00 },
    { lower_bound: 600001, upper_bound: 700000, fee: 750.00 },
    { lower_bound: 700001, fee: 800.00 },
  ]
  config.sale_fee_bands = [
    { lower_bound: 0, upper_bound: 100000, fee: 425.00 },
    { lower_bound: 100001, upper_bound: 200000, fee: 450.00 },
    { lower_bound: 200001, upper_bound: 300000, fee: 475.00 },
    { lower_bound: 300001, upper_bound: 400000, fee: 525.00 },
    { lower_bound: 400001, upper_bound: 500000, fee: 575.00 },
    { lower_bound: 500001, upper_bound: 600000, fee: 625.00 },
    { lower_bound: 600001, upper_bound: 700000, fee: 700.00 },
    { lower_bound: 700001, fee: 750.00 },
  ]
end
