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
      assert_raises Client::TicketExpired do
        client.open(static_ticket_string)
      end
    end

    def test_reject_ticket
      assert_raises Client::WrongService do
        client(service: 'other_service').open(current_ticket_string)
      end
    end

    def client(service: 'service/', key: nil)
      Client.new(service, key || verify_key_hex)
    end

  end
end
