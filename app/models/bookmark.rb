class Bookmark < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable_on :tags
  validates_presence_of :uri
  before_save :generate_uri_digest
  default_scope order('created_at desc')

  searchable do
    text :title, :boost => 5
    text :tag_list, :boost => 2
    text :raw_content
    integer :user_id
    date :created_month
    date :created_day
  end

  def created_month
    Date.new created_at.year, created_at.month, 1
  end

  def created_day
    created_at.to_date
  end

  def generate_uri_digest
    self.uri_digest = Digest::MD5.hexdigest(self.uri)
  end
end
