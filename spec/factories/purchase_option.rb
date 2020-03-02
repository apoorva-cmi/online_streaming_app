FactoryBot.define do
    factory :purchase_option do
        price 2.99
        video_quality "SD"
        purchase_optionable { FactoryBot.build(:movie) }
    end
  end
  