require 'rails_helper'

describe Account do
  it { should validate_presence_of(:twitter_name) }
  it { should validate_uniqueness_of(:twitter_name) }

  it { should validate_presence_of(:twitter_id) }
  it { should validate_uniqueness_of(:twitter_id) }
end
