class Url < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :clicks
  has_many :comments
  has_many :tags, :through => :tags_to_urls
  has_many :tags_to_urls
  belongs_to :user

  # takes a long URL and either finds the existing short
  # version or shortens it and saves that to the DB
  def self.shorten_url(long_url, user) #User!!!!!!
    # check if long_url already exists.  If so, return existing short.
    url = Url.find_by_long(long_url)
    if url.nil?
      url = Url.new
      shortened_key = rand(1000).to_s.rjust(4,"0")
      url.shortened = "www.#{shortened_key}.io"
      url.long = long_url
      url.user_id = user.id
      url.save!
    end
    url
  end

  def self.launch_url(shortened_url, user)

    url = Url.find_by_shortened(shortened_url)
    if url.nil?
      puts "FAILURE: That shortened URL doesn't exist!"
    else
      Click.create(url_id: url.id, user_id: user.id)
      puts "Congrats! ...launching.... (not really)"
      #Launchy.open(url.long)
      url.comments.each_with_index do |comment, i|
        puts "#{i+1} | #{comment.text}"
        puts
      end
      true
    end
  end

  def click_count
    self.clicks.count
  end

  def unique_click_count
    self.clicks.pluck(:user_id).uniq.count
  end

  def clicks_since(num_mins = 10)
    threshold = num_mins.minutes.ago
    self.clicks.find(:all, :conditions => ['clicks.created_at > ?', threshold]).size
  end

end
