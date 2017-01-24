require 'test_helper'
require 'rbsso/server'
require 'rbsso/client'

class IntegrationTest < Minitest::Test

  def test_server_client_flow
    # server
    server = RbSSO::Server.new seed
    ticket = server.ticket user: "user",
      service: "service/",
      domain: "domain",
      nonce: "nonce"

    # client
    client = RbSSO::Client.new 'service/', server.verify_key
    info = client.open(ticket, nonce: "nonce")
    assert_equal 'user', info[:name]
    assert_equal 'user@domain', info[:email]
  end

  def seed
    "10d346218f163de77c76165c44819c677166be091ab47ecf22e52a8b9af57335"
  end

end
