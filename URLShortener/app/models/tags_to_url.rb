class TagsToUrl < ActiveRecord::Base
  attr_accessible :url_id, :tag_id

  belongs_to :url
  belongs_to :tag

end