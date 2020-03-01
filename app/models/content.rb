class Content < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases

    validates :title, presence: true
    validates :plot, presence: true
end
