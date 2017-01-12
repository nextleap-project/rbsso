require 'test_helper'
require 'rbsso/server'
require 'base64'

class RbSSO::ServerTest < Minitest::Test

  def test_ticket
    assert_match /3|user|service|domain|14/,
      Base64.urlsafe_decode64(server.ticket(user, service, domain))
  end

  def server
    RbSSO::Server.new(secret)
  end

  def secret; '1234567890ABCDEF' * 4; end
  def user; 'user'; end
  def service; 'service' ; end
  def domain; 'domain' ; end
end
