class InitialTweetsFetch
  include Interactor

  def call
    FetchTweetsJob.perform_later context.account.id
  end
end
