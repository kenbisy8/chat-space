class TopController < ApplicationController

  def index
    @side_group_data = current_user.groups
  end
end
