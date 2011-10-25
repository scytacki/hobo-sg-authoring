class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :pages, :text, :text
  end

  def self.down
    remove_column :pages, :text
  end
end
