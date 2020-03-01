class PurchaseOption < ApplicationRecord
    belongs_to :purchase_optionable, polymorphic: true
    has_many :purchases
end
