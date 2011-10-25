class ImagePane < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    url  :string
    timestamps
  end

  has_one :page_pane, :as => :pane
  has_one :page, :through => :page_pane

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
