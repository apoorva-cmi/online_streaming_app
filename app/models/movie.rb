class Movie < Content
    validates :number, absence: true
    has_many :purchase_options, as: :purchase_optionable
end
