class Account < ActiveRecord::Base
  validates :twitter_name, :twitter_id, presence: true, uniqueness: { scope: [:twitter_name, :twitter_id]}

  scope :recent, -> { order('created_at DESC').limit(10) }

  def to_param
    twitter_name
  end
end
