class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :password, :password_confirmation
  has_secure_password
  acts_as_tagger
  validates_presence_of :password, :on => :create

  has_many :bookmarks, :dependent => :delete_all
  has_many :imports, :dependent => :delete_all
end
