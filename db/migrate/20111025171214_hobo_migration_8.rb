class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :image_panes, :attribution, :text
  end

  def self.down
    remove_column :image_panes, :attribution
  end
end
