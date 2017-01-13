require 'test_helper'
require 'rbsso/authentication'

class RbSSO::AuthenticationTest < Minitest::Test

  def test_basic_attributes
    assert_equal 'user', auth.user
    assert_equal 'service', auth.service
    assert_equal 'domain', auth.domain
  end

  def test_to_s
    assert_match /^3|user|service|domain|\d*|$/, auth.to_s
  end

  def test_parse
    parsed = RbSSO::Authentication.parse auth.to_s
    assert_equal auth, parsed
  end

  def test_invalid_version
    assert_raises RbSSO::Authentication::VersionMismatch do
      RbSSO::Authentication.parse '4|other versions may contain other auth'
    end
  end

  def auth
    RbSSO::Authentication.new user: 'user',
      service: 'service',
      domain: 'domain'
  end
end
