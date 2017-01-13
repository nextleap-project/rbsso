require 'test_helper'
require 'rbnacl'
require 'rbsso/ticket'

class RbSSO::TicketTest < Minitest::Test
  include TestData

  def test_sign_constructor
    ticket = RbSSO::Ticket.sign static_content, signing_key
    assert_equal static_ticket_string, ticket.to_base64
  end

  def test_open_constructor
    ticket = RbSSO::Ticket.open static_ticket_string, verify_key
    assert_equal static_content, ticket.content
  end

end
