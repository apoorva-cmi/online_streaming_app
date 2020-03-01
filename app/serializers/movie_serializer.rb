class MovieSerializer < ActiveModel::Serializer
    attributes :id, :title, :plot, :type, :created_at, :updated_at
end  