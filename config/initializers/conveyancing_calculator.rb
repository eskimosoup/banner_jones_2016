ConveyancingCalculator.configure do |config|
  config.purchase_fee_bands = { outside_london: [
    { lower_bound: 0, upper_bound: 100_000, fee: 450.00 },
    { lower_bound: 100_001, upper_bound: 200_000, fee: 475.00 },
    { lower_bound: 200_001, upper_bound: 300_000, fee: 525.00 },
    { lower_bound: 300_001, upper_bound: 400_000, fee: 575.00 },
    { lower_bound: 400_001, upper_bound: 500_000, fee: 625.00 },
    { lower_bound: 500_001, upper_bound: 600_000, fee: 700.00 },
    { lower_bound: 600_001, upper_bound: 700_000, fee: 750.00 },
    { lower_bound: 700_001, fee: 800.00 }
  ], london:
    [
      { lower_bound: 0, upper_bound: 100_000, fee: 675.00 },
      { lower_bound: 100_001, upper_bound: 200_000, fee: 475.00 },
      { lower_bound: 200_001, upper_bound: 300_000, fee: 525.00 },
      { lower_bound: 300_001, upper_bound: 400_000, fee: 575.00 },
      { lower_bound: 400_001, upper_bound: 500_000, fee: 625.00 },
      { lower_bound: 500_001, upper_bound: 600_000, fee: 700.00 },
      { lower_bound: 600_001, upper_bound: 700_000, fee: 750.00 },
      { lower_bound: 700_001, fee: 800.00 }
    ] }

  config.sale_fee_bands = { outside_london: [
    { lower_bound: 0, upper_bound: 100_000, fee: 425.00 },
    { lower_bound: 100_001, upper_bound: 200_000, fee: 450.00 },
    { lower_bound: 200_001, upper_bound: 300_000, fee: 475.00 },
    { lower_bound: 300_001, upper_bound: 400_000, fee: 525.00 },
    { lower_bound: 400_001, upper_bound: 500_000, fee: 575.00 },
    { lower_bound: 500_001, upper_bound: 600_000, fee: 625.00 },
    { lower_bound: 600_001, upper_bound: 700_000, fee: 700.00 },
    { lower_bound: 700_001, fee: 750.00 }
  ], london:
    [
      { lower_bound: 0, upper_bound: 100_000, fee: 425.00 },
      { lower_bound: 100_001, upper_bound: 200_000, fee: 450.00 },
      { lower_bound: 200_001, upper_bound: 300_000, fee: 475.00 },
      { lower_bound: 300_001, upper_bound: 400_000, fee: 525.00 },
      { lower_bound: 400_001, upper_bound: 500_000, fee: 575.00 },
      { lower_bound: 500_001, upper_bound: 600_000, fee: 625.00 },
      { lower_bound: 600_001, upper_bound: 700_000, fee: 700.00 },
      { lower_bound: 700_001, fee: 750.00 }
    ] }

  # Used within the models
  config.additional_costs = { outside_london: [
    { shared_ownership_scheme: 150 },
    { leasehold_house: 50 },
    { leasehold_apartment: 150 },
    { help_to_buy_scheme: 150 },
    { help_to_buy_isa: 50 },
    { deed_of_trust: 150 }
  ], london:
    [
      { shared_ownership_scheme: 150 },
      { leasehold_house: 50 },
      { leasehold_apartment: 150 },
      { help_to_buy_scheme: 150 },
      { help_to_buy_isa: 50 },
      { deed_of_trust: 150 }
    ] }

  # Static in the code
  config.additional_static_costs = { outside_london: [
    { premium_search: 270.83 }
  ], london:
    [
      { premium_search: 270.83 }
    ] }
end
