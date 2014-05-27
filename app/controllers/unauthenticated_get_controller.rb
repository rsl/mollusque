class UnauthenticatedGetController < ApplicationController
  def allow_unauthenticated_get_requests?
    true
  end
end
