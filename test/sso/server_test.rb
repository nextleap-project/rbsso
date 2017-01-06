require 'test_helper'
require 'sso/server'

class SSO::ServerTest < Minitest::Test

  def test_ticket
    assert_match /3|user|service|domain|14/, server.ticket(user, service, domain)
  end

  def server
    SSO::Server.new(secret)
  end

  def secret; '1234567890ABCDEF' * 4; end
  def user; 'user'; end
  def service; 'service' ; end
  def domain; 'domain' ; end
end
