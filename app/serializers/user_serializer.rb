class UserSerializer < ActiveModel::Serializer
  cache key: 'library', expires_in: 3.hours

  attributes :id, :email, :library

  def library
    contents = object.purchases.includes(:content).where("purchases.start_date <= ? AND purchases.end_date >= ?", Date.today, Date.today)
    contents.as_json(methods: :remaining_time_to_watch_in_days, except: [:user_id, :content_id])
  end
end
