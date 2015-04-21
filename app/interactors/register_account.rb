class RegisterAccount
  include Interactor::Organizer

  organize FetchTwitterUserInfo, SaveAccount, InitialTweetsFetch
end
