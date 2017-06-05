class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true

  def show_messages
    if messages.present?
      if messages.last.body
        messages.last.body
      else
        puts "画像が投稿されました。"
      end
    else
      puts "メッセージがまだありません。"
    end
  end
end
