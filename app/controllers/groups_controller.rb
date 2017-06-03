class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @group = set_group(params[:id])
  end

  def update
    @group = set_group(params[:id])
    if @group.update_attributes(group_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group(id)
    Group.find(id)
  end
end
