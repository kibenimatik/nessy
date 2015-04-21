namespace :accounts do
  desc "Update tweets for all accounts"
  task :update => [:environment] do
    Account.pluck(:id).each do |account_id|
      FetchTweetsJob.perform_later account_id
    end
  end
end
