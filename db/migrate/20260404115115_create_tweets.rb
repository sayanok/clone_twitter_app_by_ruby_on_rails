class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :tweet_text, limit: 140
      t.timestamps
    end
    add_foreign_key :tweets, :users
  end
end
