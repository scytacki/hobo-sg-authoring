class Hint < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    hint :text
    timestamps
  end

  belongs_to :pick_a_point_sequence

  acts_as_list

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
