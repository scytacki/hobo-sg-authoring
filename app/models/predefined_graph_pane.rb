class PredefinedGraphPane < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    y_label :string
    y_min :float
    y_max :float
    y_ticks :float
    # y_units
    x_label :string
    x_min :float
    x_max :float
    x_ticks :float
    # x_units
    data :text
    timestamps
  end

  has_one :page_pane, :as => :pane, :dependent => :destroy
  has_one :page, :through => :page_pane

  class << self
    alias :orig_reverse_reflection :reverse_reflection

    def reverse_reflection(association)
      case association.to_sym
      when :page
        Page.reflections[:predefined_graph_panes]
      else
        self.orig_reverse_reflection(association)
      end
    end
  end

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
