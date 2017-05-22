class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  require 'stream'

  client = Stream::Client.new(
  ENV["STREAM_KEY"],
  ENV["STREAM_SECRET"],
  :location => 'us-east'
  )

  pp "CLIENT IS WORKIGN: #{client.inspect}"

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end




end
