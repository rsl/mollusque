class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_token

private

  def authenticate_token
    return if allow_unauthenticated_get_requests?
    authenticate_or_request_with_http_token do |token, options|
      token == ENV['MOLLUSQUE_API_TOKEN']
    end
  end

  def allow_unauthenticated_get_requests?
    false
  end
end
