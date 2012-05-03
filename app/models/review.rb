class Review
  attr_accessor :caffein_dealer, :title, :published_date

  def published_date
    Time.zone.now
  end
end
