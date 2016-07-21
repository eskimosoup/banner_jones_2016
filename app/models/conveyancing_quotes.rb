module ConveyancingQuotes
  class DownloadParameterMissingError < StandardError; end
  def self.table_name_prefix
    'conveyancing_quotes_'
  end

  TITLES = ["Mr", "Mrs", "Miss", "Ms", "Dr", "Sir", "The Right Hon"].freeze
  TIMEFRAMES = ["Now", "This Month", "Next 3 Months", "Not Sure"].freeze

  def self.for_download(params)
    if params[:purchase_id].present?
      ConveyancingQuotes::Purchase.find(params[:purchase_id])
    elsif params[:remortgage_with_equity_transfer_id].present?
      ConveyancingQuotes::RemortgageWithEquityTransfer.find(params[:remortgage_with_equity_transfer_id])
    elsif params[:remortgage_id].present?
      ConveyancingQuotes::Remortgage.find(params[:remortgage_id])
    elsif params[:sale_and_purchase_id].present?
      ConveyancingQuotes::SaleAndPurchase.find(params[:sale_and_purchase_id])
    elsif params[:sale_id].present?
      ConveyancingQuotes::Sale.find(params[:sale_id])
    elsif params[:equity_transfer_id].present?
      ConveyancingQuotes::EquityTransfer.find(params[:equity_transfer_id])
    else
      raise DownloadParameterMissingError
    end
  end
end
