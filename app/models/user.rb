class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :password, :password_confirmation
  has_secure_password
  acts_as_tagger
  validates_presence_of :password, :on => :create
  before_create { generate_token(:auth_token) }

  has_many :bookmarks, :dependent => :delete_all
  has_many :imports, :dependent => :delete_all

  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
