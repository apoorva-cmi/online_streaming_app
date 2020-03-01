class Episode < Content
    belongs_to :season, class_name: "Season"

    validates :number, presence: true
end
