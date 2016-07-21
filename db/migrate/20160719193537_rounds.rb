class Rounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.string :leader
      t.string :follower
      t.integer :profit
      t.integer :inputleader
      t.integer :inputfollower
      t.integer :user_id, null: false
    end
  end
end
