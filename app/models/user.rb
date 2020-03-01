class User < ApplicationRecord
    has_many :purchases
    has_many :contents, through: :purchases

    def library
        self.contents.includes(:purchases).where("purchases.start_date <= ? AND purchases.end_date >= ?", Date.today, Date.today)
    end
end
