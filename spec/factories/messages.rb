FactoryGirl.define do

  factory :message do
    body "すごーーーーい！"
    image File.open(Rails.root.join('spec/fixtures/files/test.jpeg'))
    user
    group
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
