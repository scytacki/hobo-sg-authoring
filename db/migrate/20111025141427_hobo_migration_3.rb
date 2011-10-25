class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :pages, :activity_id, :integer

    add_index :pages, [:activity_id]
  end

  def self.down
    remove_column :pages, :activity_id

    remove_index :pages, :name => :index_pages_on_activity_id rescue ActiveRecord::StatementInvalid
  end
end
