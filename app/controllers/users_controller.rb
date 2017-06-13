class UsersController < ApplicationController

  def search
    @users = User.where('nickname LIKE(?)', "%#{params[:q]}%")
    respond_to do |format|
      format.json
    end
  end

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
