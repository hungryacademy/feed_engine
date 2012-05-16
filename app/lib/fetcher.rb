module Fetcher

    # defaults to 20, unless it doesn't
  def self.fetch_tweets(user, count=nil)
    if count
      Twitter.user_timeline(user_id: user.auth_for("twitter").uid.to_i, 
                            count: count)
    else
      Twitter.user_timeline(user_id: user.auth_for("twitter").uid.to_i)
    end
  end

  def self.create_post_from_twitter(user_id, status)
    user = User.find(user_id)
    user.twitter_posts.create(
      twitter_id: status.id,
      text: status.text,
      published_at: status.created_at
      )
  end

  def self.fetch_and_import_tweets(uid, user_id)
    statuses = Twitter.user_timeline(user_id: uid.to_i)
    statuses.each do |status|
      Fetcher.create_post_from_twitter(user_id, status)
    end
  end

  def self.import_items(provider, uid, user_id)
    case provider
    when "twitter"
      Fetcher.fetch_and_import_tweets(uid, user_id)
    end
  end

end