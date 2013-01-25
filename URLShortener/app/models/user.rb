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

  def self.get_obj_using_name(user_name)
    User.where(:name => user_name).first
  end

end
