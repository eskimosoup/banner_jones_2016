class DownloadPresenter < BasePresenter
  presents :download
  delegate :name, to: :download

  def linked_text(text = 'View', options = {})
    h.link_to text, download, options
  end

  def summary
    h.simple_format download.summary
  end

  def description
    h.raw download.description
  end
end
