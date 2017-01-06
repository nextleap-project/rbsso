require 'test_helper'
require 'sso/ticket'

class SSO::TicketTest < Minitest::Test

  def test_basic_attributes
    assert_equal 'user', ticket.user
    assert_equal 'service', ticket.service
    assert_equal 'domain', ticket.domain
  end

  def test_to_s
    assert_match /^3|user|service|domain|\d*|$/, ticket.to_s
  end

  def test_parse
    parsed = SSO::Ticket.parse ticket.to_s
    assert_equal ticket, parsed
  end


  def ticket
    SSO::Ticket.new user: 'user',
      service: 'service',
      domain: 'domain'
  end
end
