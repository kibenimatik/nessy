class FetchTweetsJob < ActiveJob::Base
  queue_as :default

  def perform(account_id)
    account = Account.find(account_id)

    UpdateAccountTweets.new(account).update
  end



end
