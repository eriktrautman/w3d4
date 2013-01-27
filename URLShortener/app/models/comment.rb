class Comment < ActiveRecord::Base
  # MZ-1/27: I forgot to mention that in order to get the comment i made on line
  # 14 to work, u would have to add these attr_accessibles ->  :user, :url
  attr_accessible :text, :user_id, :url_id
  belongs_to :url
  belongs_to :user

  # MZ: You can pass around the actual user object because... (see line #11)
  def self.create_comment(text, user_id, long_url)
    # MZ: What if a different user had submitted the same link?
    # Maybe better to search with user & long_url
    url = Url.where(:long => long_url).first
    # MZ: Here you can rewrite line #15 like this and rails accepts it:
    # create(:text => text, :user => user, :url => url)
    self.create(:text => text, :user_id => user_id, :url_id => url.id)
  end

end
