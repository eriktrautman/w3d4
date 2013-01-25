# Erik and Vincent 1/24/13

  print "Log in name > "
  user_name = gets.chomp

  if User.exists?(user_name)
    current_user = User.get_obj_using_name(user_name)
  else
    current_user = User.create(:name => user_name)
  end

  puts current_user.inspect

  while true
    puts "Please select from the following options:"
    puts
    options = ["Shorten url","Go to URL","Comment on url","Display Stats for url","Display User's urls"]
    options.each_with_index do |option, i|
      puts "#{i} | #{option} "
    end
    print " > "
    selection = gets.chomp.to_i

    case selection
    when 0
      puts "Input url to shorten:"
      print " > "
      url = gets.chomp
      puts "Select tag or tags to include (separated by commas)"
      tags = Tag.all
      tags.each_with_index do |tag, i|
        puts "#{i} | #{tag.name} "
      end
      short_url =  Url.shorten_url(url, current_user)
      puts short_url.shortened

      tag_num = gets.chomp.split(',').map(&:to_i)
      tag_num.each do |tag|
        TagsToUrl.create(:url_id => short_url.id, :tag_id => tag)
      end
    when 1
      puts "Input shortened url to launch:"
      print " > "
      url = gets.chomp
      puts Url.launch_url(url, current_user)
    when 2
      puts "Enter the url that you would like to comment on:"
      print " > "
      url = gets.chomp
      puts "Enter your comment:"
      print " > "
      text = gets.chomp
      puts Comment.create_comment(text, current_user.id, url)
    when 3
    when 4
    else
      exit
    end
# SELECT tags.name, COUNT(tag.id)
# FROM tags
#   JOIN tags_to_urls
#     ON tags.id = tags_to_urls.tag_id
#   GROUP BY tags.id

# Tag.joins(TagsToUrl)
  end