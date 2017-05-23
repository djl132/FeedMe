class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # require 'stream'
  #
  # CLIENT = Stream::Client.new(
  # ENV["STREAM_KEY"],
  # ENV["STREAM_SECRET"],
  # :location => 'us-east'
  # )
  #
  # def client
  #   CLIENT
  # end





  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end




end
