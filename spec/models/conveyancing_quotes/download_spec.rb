require 'rails_helper'

RSpec.describe ConveyancingQuotes::Download do
  describe '#filename' do
    context 'equity transfer' do
      it 'returns the correct name' do
        quote = ConveyancingQuotes::EquityTransfer.new
        download = build_download(quote)

        expect(download.filename).to eq("Banner Jones Conveyancing Quote - Equity Transfer.pdf")
      end
    end

    context 'purchase' do
      it 'returns the correct name' do
        quote = ConveyancingQuotes::Purchase.new
        download = build_download(quote)

        expect(download.filename).to eq("Banner Jones Conveyancing Quote - Purchase.pdf")
      end
    end
    
    def build_download(quote)
      ConveyancingQuotes::Download.new(quote)
    end
  end
end
