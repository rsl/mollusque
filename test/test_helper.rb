ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  def self.authenticated_context
    context 'Authenticated requests' do
      setup do
        @request.headers['HTTP_AUTHORIZATION'] =
          ActionController::HttpAuthentication::Token.encode_credentials(ENV['MOLLUSQUE_API_TOKEN'])
      end

      yield
    end
  end
end
