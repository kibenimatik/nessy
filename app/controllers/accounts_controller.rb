class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find_by!(name: params[:id])
  end

  def create
    result = CreateAccount.call(account_params)

    if result.success?
      redirect_to root_path, notice: 'Account was successfully created.'
    else
      redirect_to root_path, alert: result.message
    end
  end

  private
    def account_params
      params.require(:account).permit(:name)
    end
end
