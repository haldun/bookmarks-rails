  def create
    uploaded_io = params[:file]
    doc = Nokogiri::HTML uploaded_io
    doc.xpath('//a').each do |link|
      bookmark = current_user.bookmarks.build
      bookmark.title = link.content
      bookmark.uri = link.attr 'href'
      bookmark.is_private = link.attr('private') == '1'
      add_date = link.attr 'add_date'
      bookmark.created_at = Time.at(add_date.to_i) if add_date.present?
      bookmark.tag_list = link.attr 'tags'
      bookmark.save
    end
  end
end