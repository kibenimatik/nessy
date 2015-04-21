class Account < ActiveRecord::Base
  validates :name, presence: true

  scope :recent, -> { order('created_at DESC').limit(10) }

  def to_param
    name
  end
end
