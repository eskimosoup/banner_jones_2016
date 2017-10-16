# frozen_string_literal: true

module ConveyancingQuotes
  class Download
    def initialize(current_user)
      @current_user = current_user
    end

    def to_pdf
      kit = PDFKit.new(as_html)
      kit.to_file('tmp/conveyancing_quote.pdf')
    end

    def filename
      'Banner Jones Conveyancing Quote.pdf'
    end

    def render_attributes
      {
        template: "conveyancing_quotes/users/pdf",
        layout: 'quote_pdf',
        locals: { current_user: current_user }
      }
    end

    private

    attr_reader :current_user

    def as_html
      ApplicationController.render(render_attributes)
    end
  end
end
