class HoboMigration14 < ActiveRecord::Migration
  def self.up
    create_table :hints do |t|
      t.text     :hint
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :pick_a_point_sequence_id
    end
    add_index :hints, [:pick_a_point_sequence_id]
  end

  def self.down
    drop_table :hints
  end
end
