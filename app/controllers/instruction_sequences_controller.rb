class InstructionSequencesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :page, [ :index, :new, :create ]
  
  def new_for_page
    id = params["page_id"]
    owner = Page.find(id)
    new_sequence = owner.instruction_sequences.new
    new_sequence.page = owner
    hobo_new_for :page, new_sequence
  end
  
  def create_for_page
    id = params["page_id"]
    owner = Page.find(id)
    attributes = attribute_parameters
    attributes[:page] = owner
    hobo_create_for :page, :attributes => attributes
  end

end
