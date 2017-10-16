
# frozen_string_literal: true

module ConveyancingQuotes
  class DownloadsController < BaseController
    before_action :valid_user

    def show
      respond_to do |format|
        format.pdf { send_quote_pdf }
        format.html { render_sample_html } if Rails.env.development?
      end
    end

    private

    def download
      ConveyancingQuotes::Download.new(current_user)
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
