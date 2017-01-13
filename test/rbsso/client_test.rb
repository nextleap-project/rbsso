require 'test_helper'
require 'rbsso/client'

class RbSSO::ClientTest < Minitest::Test

  def test_check_key_lenght
    assert_raises RbNaCl::LengthError do
      RbSSO::Client.new 'service/', verify_key + '1'
    end
  end

  def test_check_key_content
    assert_raises ArgumentError do
      RbSSO::Client.new 'service/', verify_key.tr('ab', 'xy')
    end
  end

  def test_open_ticket
    info = client.open(ticket_string)
    assert_equal 'ale@sso.net', info[:email]
    assert_equal 'ale', info[:name]
  end

  def test_reject_ticket
    assert_raises RuntimeError do
      client(service: 'other_service').open(ticket_string)
    end
  end

  def client(service: 'service/', key: nil)
    RbSSO::Client.new(service, key || verify_key)
  end

  def verify_key
    'c0dadbb483765b055d4f9ff5554d92b3ed7a433f15f4d8ebabbbd072510bfe23'
  end

  def ticket_string
    '4bHHseETK5U9YblImiqUpPHnEktAHIlICzb8w6jfrcrDyj/y7EtWoFVTvmTPcpJKHdh7TPPYgEVHVFH4DwKsCDN8YWxlfHNlcnZpY2UvfHNzby5uZXR8MTQxNTU3NDg0NHw='
  end
end
