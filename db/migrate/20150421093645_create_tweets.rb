class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :account_id
      t.string :tweet_id
      t.string :tweet_text
      t.timestamp :tweet_created_at
      t.timestamps null: false
    end
  end
end
