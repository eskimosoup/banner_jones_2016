
module ConveyancingQuotes
  class DownloadsController < ::ApplicationController
    def show
      respond_to do |format|
        format.pdf { send_quote_pdf }

        if Rails.env.development?
          format.html { render_sample_html }
        end
      end
    end

    private

    def quote
      ConveyancingQuotes.for_download(params)
    end

    def download
      ConveyancingQuotes::Download.new(quote)
    end

    def send_quote_pdf
      send_file download.to_pdf, download_attributes
    end

    def render_sample_html
      render download.render_attributes
    end

    def download_attributes
      {
        filename: download.filename,
        type: 'application/pdf',
        disposition: 'inline'
      }
    end
  end
end
