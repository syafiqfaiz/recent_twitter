class User < ActiveRecord::Base
  # Remember to create a migration!

  has_many :tweets

  def self.find_or_create(username)
     current_user = User.find_by_username(username)
    if current_user != nil
      user = current_user
    else
      user = User.create(username: username)
    end
    user
  end

  def get_10_tweets
    tweets = $client.user_timeline(self.username).take(10)
    tweets.each do |tweet|
      self.tweets.create(text: tweet.text, user_id: self.id)
    end
    tweets
  end
end
