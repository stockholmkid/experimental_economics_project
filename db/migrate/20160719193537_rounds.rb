class Rounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.string :leader, null: false
      t.string :follower, null: false
      t.integer :profit, null: false, default: 0
      t.integer :inputleader, null: false
      t.integer :inputfollower, null: false
      t.integer :user_id, null: false
    end
  end
end
