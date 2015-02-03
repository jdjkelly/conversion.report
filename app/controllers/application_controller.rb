class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_body_classes

  def set_body_classes
    @body_classes = [params[:controller], params[:action]]
  end
end
