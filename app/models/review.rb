class Review
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :caffein_dealer, :title, :published_date, :consistency, :price, :speed

  validates :title, presence: true
  validates :consistency, :presence => true, :numericality => { :only_integer => true }
  validates :price, :presence => true, :numericality => { :only_integer => true }
  validates :speed, :presence => true, :numericality => { :only_integer => true }

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

  def rank
    _rank.call.tap do |r|
      r.consistency = self.consistency
      r.price = self.price
      r.speed = self.speed
    end
  end

  private
  def _rank
    @rank ||= Rank.public_method(:new)
  end
end
