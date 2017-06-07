FactoryGirl.define do

  factory :message do
    body "すごーーーーい！"
    image File.open(Rails.root.join('spec/fixtures/files/test.jpeg'))
    user_id 1
    group_id 1
    user
    group
  end

end
