require 'test_helper'
require 'rbsso/server'
require 'base64'

class RbSSO::ServerTest < Minitest::Test

  def test_check_seed
    assert_raises ArgumentError do
      RbSSO::Server.new('invalid seed')
    end
  end

  def test_ticket_content
    assert_match /3|user|service|domain|14/,
      Base64.urlsafe_decode64(ticket)
  end

  def ticket
    server.ticket user: user,
      service: service,
      domain: domain
  end

  def server
    RbSSO::Server.new(secret)
  end

  def secret; '1234567890ABCDEF' * 4; end
  def user; 'user'; end
  def service; 'service' ; end
  def domain; 'domain' ; end
end
