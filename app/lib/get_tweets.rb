require 'json'
require 'net/http'
require 'twitter'
require "./config/initializers/twitter"

module GetTweets
  class Tweets
    attr_accessor :client, :base_url
    def initialize
      @base_url = ENV["DOMAIN"] || "http://api.hungrlr.dev/v1"
    end
    # Name needs changed
    def send
      Net::HTTP.post_form(
                          URI("http://api.hungrlr.dev/v1/user_tweets"),
                          tweets: collect_all_tweets.to_json
                          )
    end
    # client  = twitter_client
    #client.prepare_tweets
    def collect_all_tweets
      get_users["users"].collect do |user|
        twitter_client(user["twitter_token"], user["twitter_secret"])
        prepare_tweets(user["twitter_id"], user["id"])
      end
    end

    def get_users
      users_json = Net::HTTP.get(URI("http://api.hungrlr.dev/v1/user_tweets"))
      JSON.parse(users_json)
      # JSON.parse(Net::HTTP.get(URI("v1/users?service=twitter")))
    end

    def get_tweets(twitter_id)
      if twitter_id
        client.user_timeline({:since_id => twitter_id})
      else
        client.user_timeline()
      end
    end

    def prepare_tweets(twitter_id, user_id)
      get_tweets(twitter_id).collect do |tweet|
        {
          comment: tweet.text,
          link: tweet.source,
          external_id: tweet.id,
          created_at: tweet.created_at,
          user_id: user_id
        }
      end
    end
    def twitter_client(token, secret)
      @client = Twitter::Client.new(:consumer_key => TWITTER_KEY,
                          :consumer_secret => TWITTER_SECRET,
                          :oauth_token => token,
                          :oauth_token_secret => secret)
    end
  end
end