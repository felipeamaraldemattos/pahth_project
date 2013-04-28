class CreatePahths < ActiveRecord::Migration
  def self.up
    create_table :pahths do |t|
      t.string :title
      t.string :description
      t.string :type
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end


end
