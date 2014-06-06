class Site < ActiveRecord::Base
  validates :name, presence: true

  before_create :ensure_api_token

private

  def ensure_api_token
    self.api_token = loop do
      token = SecureRandom.uuid
      break token unless Site.exists?(api_token: token)
    end
  end
end
