class CaffeinDealer

  include MongoMapper::Document

  key :name, String
  many :reviews

  attr_accessor :name
  attr_reader :entries
  attr_writer :review

  def initialize(reviews = [])
    push_all(:reviews => reviews)
  end

  def entries
    reviews.sort_by{ |e| e.rank }.reverse
  end

  def add_entry(entry)
    # wanted @entries << so continue to not expose reviews
    # this doesn't feel quite right
    reviews << entry
    self.save
  end

  def name
    @name ||= 'Some hipster joint'
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
