FactoryGirl.define do
  # pass = Faker::Internet.password(8)

  factory :user do
    nickname { Faker::Internet.user_name }
    password pass
    password_confirmation pass
    email { Faker::Internet.email }


    after(:create) do |user|
      create(:group_user, user: user, group: create(:group))
    end
  end
end
