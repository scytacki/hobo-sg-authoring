class Page < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    text :text
    timestamps
  end

  belongs_to :activity
  has_many :page_panes, :order => :position
  has_many :page_sequences
  
  has_many :image_panes, :through => :page_panes, :source => :pane, :source_type => 'ImagePane'
  has_many :predefined_graph_panes, :through => :page_panes, :source => :pane, :source_type => 'PredefinedGraphPane'
  has_many :table_panes, :through => :page_panes, :source => :pane, :source_type => 'TablePane'

  has_many :instruction_sequences, :through => :page_sequences, :source => :sequence, :source_type => 'InstructionSequence'

  acts_as_list

  children :page_sequences, :page_panes

  class << self
    alias :orig_reverse_reflection :reverse_reflection

    def reverse_reflection(association)
      case association.to_sym
      when :image_panes
        ImagePane.reflections[:page]
      when :predefined_graph_panes
        PredefinedGraphPane.reflections[:page]
      when :table_panes
        TablePane.reflections[:page]
      when :instruction_sequences
        InstructionSequence.reflections[:page]
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
