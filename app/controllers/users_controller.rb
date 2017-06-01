class UsersController < ApplicationController

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to root_path, notice: "更新されました"
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
