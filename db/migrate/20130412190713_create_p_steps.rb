class CreatePSteps < ActiveRecord::Migration
  def self.up
    create_table :p_steps do |t|
      t.string :title
      t.string :content
      t.string :type_learning
      t.string :category_knowledge
      t.integer :pahth_id

      t.timestamps
    end
  end

  def self.down
    drop_table :p_steps
  end

end
