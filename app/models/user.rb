class User < ApplicationRecord
    has_many :purchases
    has_many :contents, through: :purchases

    validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/i }

    def library
        self.contents.includes(:purchases).where("purchases.start_date <= ? AND purchases.end_date >= ?", Date.today, Date.today)
    end
end
