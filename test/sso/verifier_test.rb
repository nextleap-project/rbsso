require 'test_helper'
require 'sso/verifier'

class SSO::VerifierTest < Minitest::Test

  def test_open
    assert_equal '3|ale|service/|sso.net|1415574844|', verifier.open(ticket)
  end

  def verifier
    SSO::Verifier.new verifier_key
  end

  def verifier_key
    'wNrbtIN2WwVdT5/1VU2Ss+16Qz8V9Njrq7vQclEL/iM='
  end

  def ticket
    '4bHHseETK5U9YblImiqUpPHnEktAHIlICzb8w6jfrcrDyj/y7EtWoFVTvmTPcpJKHdh7TPPYgEVHVFH4DwKsCDN8YWxlfHNlcnZpY2UvfHNzby5uZXR8MTQxNTU3NDg0NHw='
  end
end
