class User < ActiveRecord::Base
  attr_accessible :name
  has_many :clicks
  has_many :urls
  has_many :comments

  def print_urls_list
    puts "URLs submitted by #{self.name}:"
    self.urls.each_with_index do |url, i|
      puts "#{i+1}: #{url.long}"
    end
    true
  end

  def self.exists?(user_name)
    not User.where(:name => user_name).empty?
  end

  # MZ-1/27: So apparently i gave you a suggestion that's been deprecated in the upcoming version of rails, 4.0.
  # The replacement will be something like ModelName.find_by(attribute: "whatever") instead
  # of what i suggested: ModelName.find_by_attribute("whatever")
  #
  # MZ: Rails has dynamic finders that use "method_missing" to automagically make shit like this:
  # u = User.find_by_{attribute}(user_name)
  # This is pretty helpful and will make methods like this one unnecessary
  def self.get_obj_using_name(user_name)
    User.where(:name => user_name).first
  end

end
