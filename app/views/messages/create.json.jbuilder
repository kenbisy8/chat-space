json.id @message.id
json.nickname @message.user.nickname
json.body @message.body
json.image @message.image
json.created_at @message.created_at.to_s(:time)
