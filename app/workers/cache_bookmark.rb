class CacheBookmark
  @queue = :cache

  def self.perform(bookmark_id)
    bookmark = Bookmark.find bookmark_id
    request = Typhoeus::Request.new bookmark.uri, :method => :get

    hydra = Typhoeus::Hydra.new
    hydra.queue(request)
    hydra.run

    response = request.response
    bookmark.code = response.code
    bookmark.checked_at = Time.now
    bookmark.raw_content = response.body
    bookmark.save!
  end
end
