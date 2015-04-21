require 'rails_helper'

describe Tweet do
  it { should validate_presence_of(:account_id) }
  it { should validate_presence_of(:twitter_id) }
end
