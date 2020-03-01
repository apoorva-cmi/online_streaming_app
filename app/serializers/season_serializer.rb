class SeasonSerializer < ActiveModel::Serializer
    attributes :id, :title, :plot, :number, :type, :created_at, :updated_at

    has_many :episodes
end  