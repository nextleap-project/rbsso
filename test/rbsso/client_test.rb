require 'test_helper'
require 'rbsso/client'

module RbSSO
  class ClientTest < Minitest::Test
    include TestData

    def test_check_key_lenght
      assert_raises RbNaCl::LengthError do
        Client.new 'service/', verify_key_hex + '1'
      end
    end

    def test_check_key_content
      assert_raises ArgumentError do
        Client.new 'service/', verify_key_hex.tr('ab', 'xy')
      end
    end

    def test_open_ticket
      auth = client.open(current_ticket_string)
      assert auth
    end

    def test_open_ticket_with_nonce
      auth = client.open(current_ticket_with_nonce_string, nonce: 'nonce')
      assert auth
    end

    def test_reject_expired_ticket
      assert_raises Client::TicketExpired do
        client.open(static_ticket_string)
      end
    end

    def test_reject_wrong_service
      assert_raises Client::WrongService do
        client(service: 'other_service').open(current_ticket_string)
      end
    end

    def test_reject_missing_nonce
      assert_raises Client::NonceMismatch do
        client.open(current_ticket_string, nonce: 'nonce')
      end
    end

    def client(service: 'service', key: nil)
      Client.new(service, key || verify_key_hex)
    end

  end
end
