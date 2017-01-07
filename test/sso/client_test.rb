require 'test_helper'
require 'sso/client'

class SSO::ClientTest < Minitest::Test

  def test_open_ticket
    info = client.open(ticket_string)
    assert_equal 'ale@sso.net', info[:email]
    assert_equal 'ale', info[:name]
  end

  def client
    SSO::Client.new(verifier_key)
  end

  def verifier_key
    Base64.encode64 "\xc0\xda\xdb\xb4\x83v[\x05]O\x9f\xf5UM\x92\xb3\xedzC?\x15\xf4\xd8\xeb\xab\xbb\xd0rQ\x0b\xfe#"
  end

  def ticket_string
    '4bHHseETK5U9YblImiqUpPHnEktAHIlICzb8w6jfrcrDyj/y7EtWoFVTvmTPcpJKHdh7TPPYgEVHVFH4DwKsCDN8YWxlfHNlcnZpY2UvfHNzby5uZXR8MTQxNTU3NDg0NHw='
  end
end
