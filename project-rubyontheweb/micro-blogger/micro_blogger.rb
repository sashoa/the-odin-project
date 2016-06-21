require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Message too big. Make sure it is less than 140 characters."
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message    
    message = "d @#{target} #{message}"
    screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
     if screen_names.include?(target)
       tweet(message)
     else
       puts "You can dm only people that follow you."
     end
  end  
  
  def followers_list
    @client.followers.collect { |follower| @client.user(follower).screen_name }
  end

  def spam_my_followers(message)
    followers_list.each { |follower| dm(follower, message) }
  end

  def everyones_last_tweet
    friends = @client.friends.sort_by { |a,b| a.screen_name <=> b.screen_name }
    friends.each do |friend|
      timestamp = friend.status.created_at
      puts "#{friend.screen_name}: #{friend.status.text} at #{timestamp.strftime("%A, %b %d")}"
    end
  end

  def run
    puts "Welcome to the JSL Twitter Client!"

    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]

      case command
      when 'q' then puts "Goodbye!"
      when 't' then tweet(parts[1..-1].join(" "))
      when 'dm' then dm(parts[1], parts[2..-1].join(" "))
      when 's' then spam_my_followers(parts[1..-1].join(" "))
      when 'elt' then everyones_last_tweet
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.run
