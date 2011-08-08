class Bookmark < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uri
  before_save :generate_uri_digest

  def generate_uri_digest
    self.uri_digest = Digest::MD5.hexdigest(self.uri)
  end
end
