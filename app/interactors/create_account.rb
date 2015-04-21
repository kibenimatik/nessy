class CreateAccount
  include Interactor

  def call
    account = Account.new(name: context.name)
    if account.valid?
      account.save!
    else
      context.fail!(message: account.errors.full_messages.first)
    end
  end
end
