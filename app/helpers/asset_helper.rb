module AssetHelper
  # https://gist.github.com/mrreynolds/4fc71c8d09646567111f
  # 'pic_1980.jpg', { 'pic_640.jpg': '640w', 'pic_1024.jpg': '1024w', 'pic_1980.jpg': '1980w' }, sizes: '100vw', class: 'my-image'
  def image_srcset(source, srcset = {}, options = {})
    srcset = srcset.map { |src, size| "#{asset_path(src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end
end
