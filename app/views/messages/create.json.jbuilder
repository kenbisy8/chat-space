json.nickname @message.user.nickname
json.body @message.body
json.image @message.image
json.group_id @message.group_id
json.user_id @message.user_id
json.created_at @message.created_at.to_s(:time)
