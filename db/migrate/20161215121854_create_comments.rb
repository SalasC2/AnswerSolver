class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :remark
      t.reference :commentable
      t.string :commentable_type
    end
  end
end
