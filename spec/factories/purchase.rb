FactoryBot.define do
    factory :purchase do
        user { FactoryBot.build(:user) }
        content { FactoryBot.build(:movie) }
        content_type "Movie"
        purchase_option { FactoryBot.build(:purchase_option) }
        price 2.99
        video_quality "SD"
        start_date Date.today
    end
  end
  