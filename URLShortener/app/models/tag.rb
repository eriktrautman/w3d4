class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :urls, :through => :tags_to_urls
  has_many :tags_to_urls

end
