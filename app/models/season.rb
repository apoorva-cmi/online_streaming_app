class Season < Content
    has_many :episodes, -> { order(:number) }, class_name: "Episode", foreign_key: "season_id"
    has_many :purchase_options, as: :purchase_optionable

    validates :number, presence: true
end
