class PagesController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :activity, [:new, :create]

end
