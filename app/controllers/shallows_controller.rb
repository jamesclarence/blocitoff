class ShallowsController < ApplicationController
  def index
    render "users/show" if current_user.present?
  end

  def about
  end
end
