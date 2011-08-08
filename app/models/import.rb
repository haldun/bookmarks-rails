class Import < ActiveRecord::Base
  belongs_to :user
  attr_accessible :file
  mount_uploader :file, ImportFileUploader
end
