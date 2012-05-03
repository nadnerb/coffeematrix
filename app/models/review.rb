class Review
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :caffein_dealer, :title, :published_date

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=",v) }
  end

  def publish(clock = DateTime)
    self.published_date = clock.now
    caffein_dealer.add_entry(self)
    return true
  end

  def persisted?
    false
  end
end
