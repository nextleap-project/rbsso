require 'test_helper'
require 'sso/server'
require 'sso/client'

class IntegrationTest < Minitest::Test

  def test_server_client_flow
    # server
    server = SSO::Server.new seed
    ticket = server.ticket("user", "service", "domain")

    # client
    client = SSO::Client.new server.verifier_key
    info = client.open(ticket)
    assert_equal 'user', info[:name]
    assert_equal 'user@domain', info[:email]
  end

  def seed
    "10d346218f163de77c76165c44819c677166be091ab47ecf22e52a8b9af57335"
  end

end
