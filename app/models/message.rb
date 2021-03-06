class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader
  validates :body_or_image, :group_id, :user_id, presence: true

  scope :reload, -> (q){ Message.where("id > ?", q)}

  private

  def body_or_image
    body.presence or image.presence
  end
end
