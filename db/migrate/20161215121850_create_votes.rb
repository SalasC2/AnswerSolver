class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean  :up
      t.integer  :voteable_id
      t.string   :voteable_type
      t.integer  :user_id
    end
  end
end
