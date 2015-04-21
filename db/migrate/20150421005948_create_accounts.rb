class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.timestamp :last_updated

      t.timestamps null: false
    end
  end
end
