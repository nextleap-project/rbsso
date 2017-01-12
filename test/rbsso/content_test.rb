require 'test_helper'
require 'rbsso/content'

class RbSSO::ContentTest < Minitest::Test

  def test_basic_attributes
    assert_equal 'user', content.user
    assert_equal 'service', content.service
    assert_equal 'domain', content.domain
  end

  def test_to_s
    assert_match /^3|user|service|domain|\d*|$/, content.to_s
  end

  def test_parse
    parsed = RbSSO::Content.parse content.to_s
    assert_equal content, parsed
  end


  def content
    RbSSO::Content.new user: 'user',
      service: 'service',
      domain: 'domain'
  end
end
