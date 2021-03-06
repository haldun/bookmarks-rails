class ImportBookmark
  @queue = :imports

  def self.perform(import_id)
    import = Import.find import_id
    user = import.user
    doc = Nokogiri::HTML import.file.read
    doc.xpath('//a').each do |link|
      bookmark = user.bookmarks.build
      bookmark.title = link.content
      bookmark.uri = link.attr 'href'
      bookmark.is_private = link.attr('private') == '1'
      add_date = link.attr 'add_date'
      bookmark.created_at = add_date.present? ? Time.at(add_date.to_i) : Time.now
      bookmark.tag_list = link.attr 'tags'
      bookmark.save
    end
    Sunspot.index! user.bookmarks
  end
end