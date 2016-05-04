module ConveyancingQuotes
  def self.table_name_prefix
    'conveyancing_quotes_'
  end

  TITLES = ["Mr", "Mrs", "Miss", "Ms", "Dr", "Sir", "The Right Hon"].freeze
  TIMEFRAMES = ["Now", "This Month", "Next 3 Months", "Not Sure"].freeze
end
