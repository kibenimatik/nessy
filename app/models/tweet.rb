class Tweet < ActiveRecord::Base
  belongs_to :account

  validates :account_id, :tweet_id, presence: true
end
