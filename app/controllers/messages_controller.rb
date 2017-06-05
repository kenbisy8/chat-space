class MessagesController < ApplicationController

  def index
    group_data
    side_group_data
    @message = Message.new
  end

  def create
    group_data
    side_group_data
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

  def group_data
    @group = Group.find(params[:group_id])
  end

  def side_group_data
    @side_group_data = current_user.groups
  end
end
