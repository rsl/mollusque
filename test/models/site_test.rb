require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  should validate_presence_of :name

  should 'save with api_token' do
    site = build(:site)
    assert_nil site.api_token
    site.save!
    assert_not_nil site.api_token
  end
end
