class HoboMigration6 < ActiveRecord::Migration
  def self.up
    create_table :image_panes do |t|
      t.string   :name
      t.string   :url
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :image_panes
  end
end
