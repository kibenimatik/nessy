class Account < ActiveRecord::Base
  has_many :tweets

  scope :recent, -> { order('created_at DESC').limit(10) }

  validates :twitter_name, :twitter_id, presence: true, uniqueness: { scope: [:twitter_name, :twitter_id]}

  def to_param
    twitter_name
  end
end
