class FetchTwitterUserInfo
  include Interactor

  def call
    begin
      data = Twitter.client.user(context.name)
      context.twitter_id   = data.id
      context.twitter_name = data.screen_name
    rescue Twitter::Error::NotFound
      context.fail!(message: 'Twitter account does not exists')
    rescue Twitter::Error::TooManyRequests => error
      context.fail!(message: "Twitter API rate limit exceeded. Please try in #{error.rate_limit.reset_in} seconds")
    rescue
      context.fail!(message: 'Could not get twitter user info')
    end
  end
end
