class InstructionSequence < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    text :text
    timestamps
  end

  has_one :page_sequence, :as => :sequence, :dependent => :destroy
  has_one :page, :through => :page_sequence

  class << self
    alias :orig_reverse_reflection :reverse_reflection

    def reverse_reflection(association)
      case association.to_sym
      when :page
        Page.reflections[:instruction_sequences]
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
