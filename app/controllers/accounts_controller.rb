class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find_by!(twitter_name: params[:id])
  end

  def create
    result = RegisterAccount.call(name: params[:name])

    if result.success?
      redirect_to root_path, notice: 'Account was successfully created.'
    else
      redirect_to root_path, alert: result.message
    end
  end
end
