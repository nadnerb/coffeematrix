require 'active_support/concern'
# * Rescues Exception => 500
# * Rescues ActionController::RoutingErrors => 404
# * Rescues ActiveResource::ResourceNotFound => 404
# * Rescues ActionView::MissingTemplate => 404
#
module Exceptions::ExceptionHandler
  extend ActiveSupport::Concern

  included do
    if !Rails.env.development? || !Rails.env.test?
      rescue_from StandardError, :with => :rescue_500
      rescue_from ActionController::InvalidAuthenticityToken,
                  :with => :rescue_422
      rescue_from ActionController::RoutingError,
                  ActionView::MissingTemplate,
                  :with => :rescue_404
    elsif Rails.env.test?
      rescue_from Exception, :with => :rescue_dev
    end
  end

  def rescue_404(exception = nil)
    raise exception if exception && !render_custom_exceptions?

    klass = (exception && exception.class) || "Error404"
    msg   = (exception && exception.message) || "Missing Page"

    Rails.logger.warn "#{klass} #{msg} #{exception}"

    respond_to do |wants|
      wants.all  { render :nothing => true, :status => 404 }
    end
  end

  def rescue_403(exception)
    raise exception unless render_custom_exceptions?

    Rails.logger.warn "#{exception.class} #{exception}"

    respond_to do |wants|
      wants.all  { render :nothing => true, :status => 403 }
    end
  end

  def rescue_422(exception)
    raise exception unless render_custom_exceptions?

    Rails.logger.warn "#{exception.class} #{exception}"

    respond_to do |wants|
      wants.all  { render :nothing => true, :status => 422 }
    end
  end

  def rescue_500(exception)
    raise exception unless render_custom_exceptions?

    Rails.logger.error "#{exception.class }#{exception.inspect}"

    respond_to do |wants|
      wants.all  { render :nothing => true, :status => 500 }
    end
  end

  def rescue_dev(exception)
    Rails.logger.error %Q{
      #{exception.class }#{exception.inspect}

      #{exception.backtrace[0]}
    }
    respond_to do |wants|
      wants.all  { render :nothing => true, :status => 500 }
    end
  end

  private

  def render_custom_exceptions?
    Rails.application.config.consider_all_requests_local == false
  end

end
