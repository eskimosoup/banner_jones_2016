module ConveyancingQuotes
  class Download
    def initialize(quote)
      @quote = quote
    end

    def to_pdf
      kit = PDFKit.new(as_html)
      kit.to_file("tmp/conveyancing_quote.pdf")
    end

    def filename
      "Banner Jones Conveyancing Quote - #{ quote_type }.pdf"
    end

    def render_attributes
      {
        template: "#{ view_path }/pdf",
        layout: "quote_pdf",
        locals: { quote: quote }
      }
    end

    private

    attr_reader :quote

    def as_html
      ApplicationController.render(render_attributes)
    end

    def quote_type
      underscored_quote_class_name.split("_").map(&:titleize).join(" ")
    end

    def underscored_quote_class_name
      view_path.split("/").last.singularize
    end

    def view_path
      quote.class.name.tableize
    end
  end
end
