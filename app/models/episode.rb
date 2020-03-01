class Episode < Content
    belongs_to :season, class_name: "Season", optional: true
end
