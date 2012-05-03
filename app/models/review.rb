class Review
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :caffein_dealer, :title, :published_date

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=",v) }
  end

  def publish
    return true
  end

  def published_date
    Time.zone.now
  end

  def persisted?
    false
  end
end
