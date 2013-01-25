class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :url_id
  belongs_to :url
  belongs_to :user

  # MZ: You can pass around the actual user object because... (see line #11)
  def self.create_comment(text, user_id, long_url)
    # MZ: What if a different user had submitted the same link?
    # Maybe better to search with user & long_url
    url = Url.where(:long => long_url).first
    # MZ: Here you can rewrite line #13 like this and rails accepts it:
    # create(:text => text, :user => user, :url => url)
    self.create(:text => text, :user_id => user_id, :url_id => url.id)
  end

end
