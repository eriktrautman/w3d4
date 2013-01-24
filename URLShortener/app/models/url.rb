class Url < ActiveRecord::Base
  # attr_accessible :title, :body



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
    url.shortened
  end

  def self.launch_url(shortened_url, user)

    url = Url.find_by_shortened(shortened_url)
    if url.nil?
      puts "FAILURE: That shortened URL doesn't exist!"
    else
      Click.create(url_id: url.id, user_id: user.id)
      Launchy.open(url.long)
    end
  end

end
