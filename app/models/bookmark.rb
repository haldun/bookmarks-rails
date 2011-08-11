class Bookmark < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable_on :tags
  validates_presence_of :uri
  validates_uniqueness_of :uri, :scope => :user_id
  default_scope order('created_at desc')

  searchable do
    text :title, :boost => 5
    string :tag_list, :multiple => true
    text :raw_content
    integer :user_id
    date :created_month
    date :created_day
    time :created_at
  end

  def tags_json
    tags.map { |t| {:name => t.name, :id => t.name} }.to_json
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

  def status
    case code
      when 200 then :ok
      when 301, 302 then :redirected
      when 404 then :gone
    end
  end
end
