class Purchase < ApplicationRecord
    belongs_to :user
    belongs_to :content
    belongs_to :purchase_option

    scope :not_expired, -> { select{ |purchase| !purchase.expired? } }

    validates :content_type, inclusion: { in: %w(Movie Season), message: "%{value} is not a valid content_type" }

    def remaining_time_to_watch
        (end_date - Date.today).to_i
    end

    def expired?
        !remaining_time_to_watch.positive?
    end

    def remaining_time_to_watch_in_days
        "#{remaining_time_to_watch} days"
    end
end
