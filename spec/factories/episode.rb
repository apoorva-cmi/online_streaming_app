FactoryBot.define do
    factory :episode do
      title 'Pilot'
      plot "Leonard Hofstadter and Dr. Sheldon Cooper are shaken up when an attractive young aspiring actress from Omaha, Nebraska named Penny moves into the apartment across the hall from theirs."
      number 1
      season { FactoryBot.build(:season) }
    end
  end
  