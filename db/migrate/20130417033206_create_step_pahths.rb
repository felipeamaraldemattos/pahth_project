class CreateStepPahths < ActiveRecord::Migration
  def self.up
    create_table :step_pahths do |t|
      t.integer :pahth_id
      t.integer :p_step_id
      t.integer :times_taken

      t.timestamps
    end

    add_index :step_pahths, :pahth_id
    add_index :step_pahths, :p_step_id
    add_index :step_pahths, [:pahth_id, :p_step_id], unique: true

  end

  def self.down
    drop_table :step_pahths
  end

end
