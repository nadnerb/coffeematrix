class Review
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :caffein_dealer, :title, :published_date

  validates :title, presence: true

  def initialize(attrs={})
    attrs.each { |k,v| send("#{k}=",v) }
  end

  def publish(clock = DateTime)
    return false unless valid?
    self.published_date = clock.now
    caffein_dealer.add_entry(self)
  end

  def persisted?
    false
  end
end
