class UpdateAccountTweets
  def initialize(account)
    @account = account
  end

  def update
    collection = fetch_new_tweets
    save_tweets(collection)
    update_account
  end

  private

  # Download all tweets in batches by 200 items, ordered by creation date(most recent is first)
  # process stops when at least one item from batch already exists in database
  def fetch_new_tweets
    begin
      tweets = collect_with_max_id do |max_id|
        options = {count: 200, include_rts: true}
        options[:max_id] = max_id unless max_id.nil?
        Twitter.client.user_timeline(@account.twitter_name, options)
      end
    rescue Twitter::Error::TooManyRequests => error
      sleep error.rate_limit.reset_in + 1
      retry
    end
    tweets
  end

  # process downloaded tweets, and create new items
  def save_tweets(collection)
    if collection && collection.kind_of?(Array)
      collection.each do |tweet|
        @account.tweets.create(
          tweet_id: tweet.id,
          tweet_text: tweet.text,
          tweet_created_at: tweet.created_at
        ) unless @account.tweets.exists?(tweet_id: tweet.id)
      end
    end
  end

  # update stats
  def update_account
    @account.last_updated = Time.now
    @account.tweets_count = @account.tweets.count
    @account.save
  end

  def collect_with_max_id(collection=[], max_id=nil, &block)
    response = yield(max_id)
    collection += response
    response.empty? || any_item_exists?(response) ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  end

  def any_item_exists?(response)
    Tweet.exists?(tweet_id: response.map(&:id))
  end
end
