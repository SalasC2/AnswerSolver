class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :inquiry
      t.integer :user_id
    end
  end
end
