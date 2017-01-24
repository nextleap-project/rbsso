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

  def test_to_s_with_nonce
    assert_match /^3|user|service|domain|\d*|nonce|$/,
      auth_with_nonce.to_s
  end

  def test_parse
    parsed = RbSSO::Authentication.parse auth.to_s
    assert_equal auth, parsed
  end

  def test_parse_with_nonce
    parsed = RbSSO::Authentication.parse auth_with_nonce.to_s
    assert_equal auth_with_nonce, parsed
  end

  def test_invalid_version
    assert_raises RbSSO::Authentication::VersionMismatch do
      RbSSO::Authentication.parse '4|other versions may contain other auth'
    end
  end

  def auth(user: 'user', service: 'service', domain: 'domain', nonce: nil)
    RbSSO::Authentication.new user: user,
      service: service,
      domain: domain,
      nonce: nonce
  end

  def auth_with_nonce
    auth nonce: 'nonce'
  end

end
