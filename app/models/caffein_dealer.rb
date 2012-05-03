class CaffeinDealer

  attr_accessor :name
  attr_reader :entries
  attr_writer :review

  def initialize
    @entries = []
  end

  def entries
    @entries
  end

  def add_entry(entry)
    entries << entry
  end

  def name
    @name ||= 'Starchucks'
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
