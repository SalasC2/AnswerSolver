class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :remark
      t.references :commentable
      t.string :commentable_type
    end
  end
end
