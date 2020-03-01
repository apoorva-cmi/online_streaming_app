class EpisodeSerializer < ActiveModel::Serializer
    attributes :id, :title, :plot, :number, :created_at, :updated_at
end  