class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :url_id
  belongs_to :url
  belongs_to :user

  def self.create_comment(text, user_id, long_url)
    url = Url.where(:long => long_url).first
    self.create(:text => text, :user_id => user_id, :url_id => url.id)
  end

end
