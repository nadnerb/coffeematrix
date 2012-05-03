class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_dealer

  private
  def initialize_dealer
    @caffein_dealer = CAFFEIN_DEALER
  end
end
