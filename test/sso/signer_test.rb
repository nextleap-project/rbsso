require 'test_helper'
require 'sso/signer'

class SSO::SignerTest < Minitest::Test

  def test_verify_key
    verify_key = signer.verify_key
    assert_instance_of String, verify_key
    assert_equal 45, verify_key.length
  end

  def test_sign
    signature = signer.sign('asdf')
    assert_instance_of String, signature
    assert_equal 64, signature.length
  end

  def signer
    SSO::Signer.new
  end

end
