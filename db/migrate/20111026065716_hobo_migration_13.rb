class HoboMigration13 < ActiveRecord::Migration
  def self.up
    create_table :pick_a_point_sequences do |t|
      t.text     :initial_prompt
      t.string   :correct_condition
      t.text     :give_up_prompt
      t.text     :correct_prompt
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :pick_a_point_sequences
  end
end
