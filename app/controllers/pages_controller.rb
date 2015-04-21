class PagesController < ApplicationController
  def index
    @accounts = Account.recent
  end
end
