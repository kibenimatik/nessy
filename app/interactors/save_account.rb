class SaveAccount
  include Interactor

  def call
    account = Account.new(twitter_name: context.twitter_name, twitter_id: context.twitter_id)
    if account.valid?
      account.save!
      context.account = account
    else
      context.fail!(message: account.errors.full_messages.first)
    end
  end

  def rollback
    context.account.destroy
  end
end
