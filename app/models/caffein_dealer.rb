class CaffeinDealer

  attr_reader :entries
  attr_writer :review

  def initialize
    @entries = []
  end

  def entries
    @entries
  end

  def new_review(*args)
    review.call(*args).tap do |e|
      e.caffein_dealer = self
    end
  end

  private
  def review
    @review ||= Review.public_method(:new)
  end
end
