class MessagesController < ApplicationController

  def index
    find_group
    @groups = current_user.groups.includes(:messages)
    @message = Message.new
    @messages = @group.messages.order("created_at DESC").includes(:user)
  end

  def create
    find_group
    @groups = current_user.groups
    @message = Message.new(message_params)
    if @message.save(message_params)
      redirect_to group_messages_path, notice: "メッセージが送信されました"
    else
      flash.now[:alert] = "メッセージまたは画像を入力してください"
      render 'messages/index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end
end
