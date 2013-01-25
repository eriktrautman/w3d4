# user_name = ""
# until User.exists?(user_name)
#   print "Log in name > "
#   user_name = gets.chomp

# end

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
      puts Url.shorten_url(url, current_user)
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
    when 4
    when 5
    else
      exit
    end

  end