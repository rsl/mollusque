class DummyController < UnauthenticatedGetController
  def index
    render json: {dummy: true}
  end
end
