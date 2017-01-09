require 'test_helper'
require 'rbnacl'
require 'sso/ticket'

class SSO::TicketTest < Minitest::Test

  def test_sign_constructor
    ticket = SSO::Ticket.sign(content, signing_key)
    assert_equal encoded_ticket, ticket.to_base64
  end

  def test_open_constructor
    ticket = SSO::Ticket.open encoded_ticket, signing_key.verify_key
    assert_equal content, ticket.content
  end

  def content
    '3|user|service|domain|1483964492|'
  end

  def signing_key
    seed_binary = [seed].pack('H*')
    RbNaCl::SigningKey.new seed_binary
  end

  def seed
    '1234567890ABCDEF' * 4
  end

  def signature
    'A signature is a 64 byte binary string..........................'
  end

  def encoded_ticket
    "loFbFifM6T_WJfe8D9Jyr80KXWxnBYNeJUoUA2PiSZi-Q_zSbFNu6gI-ujcDHTOq90GivY5nngTDz94C4zpgDjN8dXNlcnxzZXJ2aWNlfGRvbWFpbnwxNDgzOTY0NDkyfA=="
  end
end
