FactoryGirl.define do

  factory :invalid_message, class: Message do
    body nil
    image nil
    user
    group
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
