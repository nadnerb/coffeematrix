class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_dealer
  include ::Exceptions::ExceptionHandler

  private
  def initialize_dealer
    @caffein_dealer = CaffeinDealer.first || CaffeinDealer.create(:name => 'some hipster joint')
  end
end
