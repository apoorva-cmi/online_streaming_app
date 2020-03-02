class Purchase < ApplicationRecord
    belongs_to :user
    belongs_to :content
    belongs_to :purchase_option

    scope :alive, -> { select{ |purchase| !purchase.expired? } }

    before_create :set_end_date

    validates :content_type, inclusion: { in: %w(Movie Season), message: "%{value} is not a valid content_type" }
    validates :start_date, presence: true

    def set_end_date
        self.end_date = self.start_date + 2.days
    end

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
