class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :solution
      t.integer :question_id, :user_id, null: false
    end
  end
end
