class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :clicks
  has_many :urls

  def print_urls_list
    puts "URLs submitted by #{self.name}:"
    self.urls.each_with_index do |url, i|
      puts "#{i+1}: #{url.long}"
    end
    true
  end

end
