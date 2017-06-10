class MessagesController < ApplicationController
  before_action :find_group, :get_user_groups, :show_group_messages

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージが送信されました" }
        format.json
      end
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

  def get_user_groups
    @groups = current_user.groups.includes(:messages)
  end

  def show_group_messages
    @messages = @group.messages.order("created_at DESC").includes(:user)
  end
end
