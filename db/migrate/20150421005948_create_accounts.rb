class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :twitter_name
      t.string :twitter_id
      t.timestamp :last_updated
      t.integer :tweets_count

      t.timestamps null: false
    end
  end
end
